import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_app/features/home/data/datasources/local_data_source.dart';
import 'package:news_app/features/home/presentation/bloc/page_save.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/models/formz/formz_status.dart';
import '../../../../core/models/home_datas.dart';
import '../../data/models/news.dart';
import '../../data/repo/news_repo.dart';

part 'news_bloc.freezed.dart';
part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState>
    implements CurrentPageSavable {
  NewsBloc() : super(const _NewsState()) {
    on<_Init>((event, emit) {
      final _localDataSource = NewsLocalDataSourceImpl();
      final data = _localDataSource.getBlocProperties();
      emit(state.copyWith(
          calendar: data.$1, languages: data.$2, sources: data.$3));
    });

    on<_GetNews>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final isLoadingNextPage = state.maxPage > state.curruntPage;

      final repository = NewsRepositoryImpl(
          page: isLoadingNextPage ? state.curruntPage + 1 : 1);
      final result = await repository.getNews(
          languages: state.languages,
          calendar: state.calendar,
          resources: state.sources,
          topicIndex: state.topicIndex);
      result.either((failure) {
        emit(
          state.copyWith(
            status: FormzStatus.submissionFailure,
            errorMessage: (failure as ServerFailure).errorMessage,
          ),
        );
      }, (data) {
        emit(state.copyWith(
          currentIndex: 0,
          status: FormzStatus.submissionSuccess,
          models: data.$1,
          maxPage: data.$2,
        ));
      });
    });

    on<_ChangeTopic>((event, emit) {
      emit(state.copyWith(topicIndex: event.index));
      add(const _GetNews());
    });

    on<_ApplyFilter>((event, emit) {
      emit(state.copyWith(
          calendar: event.calendar,
          languages: event.languages,
          sources: event.sources));
      add(const _GetNews());
    });

    on<_ChangeCurrentIndex>(
        (event, emit) => emit(state.copyWith(currentIndex: event.value)));
  }

  @override
  void saveCurruntPage(int newPageIndex) {
    add(_ChangeCurrentIndex(newPageIndex));
  }
}
