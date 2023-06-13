import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_app/core/error/failure.dart';
import 'package:news_app/core/models/formz/formz_status.dart';
import 'package:news_app/features/home/data/repo/news_repo.dart';

import '../../data/models/news.dart';

part 'news_event.dart';
part 'news_state.dart';
part 'news_bloc.freezed.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(const _NewsState()) {
    on<_GetNews>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final isLoadingNextPage = state.maxPage > state.curruntPage;

      final repository = NewsRepositoryImpl(
          page: isLoadingNextPage ? state.curruntPage + 1 : 1);
      final result = await repository.getNews(state.tabIndex);
      result.either((failure) {
        emit(
          state.copyWith(
            status: FormzStatus.submissionFailure,
            errorMessage: (failure as ServerFailure).errorMessage,
          ),
        );
      }, (data) {
        emit(state.copyWith(
          status: FormzStatus.submissionSuccess,
          models: data.$1,
          maxPage: data.$2,
        ));
      });
    });

    on<_ChangeTopic>((event, emit) {
      emit(state.copyWith(tabIndex: event.index));
      add(const _GetNews());
    });
  }
}
