import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/models/formz/formz_status.dart';
import '../../../../core/models/home_datas.dart';
import '../../data/datasources/local_data_source.dart';
import '../../data/models/news.dart';
import '../../data/repo/news_repo.dart';
import 'page_save.dart';

part 'news_bloc.freezed.dart';
part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState>
    implements CurrentPageSavable {
  NewsBloc() : super(const _NewsState()) {
    on<_Init>((event, emit) {
      final localDataSource = NewsLocalDataSourceImpl();
      final data = localDataSource.getBlocProperties();
      final topics = localDataSource.getTopics();
      emit(state.copyWith(
        topics: topics,
        calendar: data.$1,
        languages: data.$2,
        sources: data.$3,
      ));
    });

    on<_GetNews>((event, emit) async {
      emit(state.copyWith(
          status: FormzStatus.submissionInProgress, isFailedToLoadMore: false));
      final isLoadingNextPage = state.maxPage > state.currentPage;

      final repository = NewsRepositoryImpl(
          page: isLoadingNextPage ? state.currentPage + 1 : 1);
      final result = await repository.getNews(
          languages: state.languages,
          calendar: state.calendar,
          resources: state.sources,
          topics: state.topics,
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

    on<_ChangeTopics>((event, emit) async {
      if (!listEquals(state.topics, event.topics)) {
        emit(state.copyWith(topics: event.topics));
        await NewsLocalDataSourceImpl().saveTopics(event.topics);
        add(const NewsEvent.changeTopic(0));
      }
    });

    on<_LoadPagination>((event, emit) async {
      final int page =
          state.maxPage > state.currentPage ? state.currentPage + 1 : 1;
      if (page != 1) {
        final repository = NewsRepositoryImpl(page: page);
        final result = await repository.getNews(
            languages: state.languages,
            calendar: state.calendar,
            resources: state.sources,
            topics: state.topics,
            topicIndex: state.topicIndex);

        result.either((failure) {
          emit(
            state.copyWith(
              isFailedToLoadMore: true,
            ),
          );
        }, (data) {
          emit(state.copyWith(
            currentPage: page,
            isFailedToLoadMore: false,
            models: state.models + data.$1,
            maxPage: data.$2,
          ));
        });
      } else {
        emit(state.copyWith(isFailedToLoadMore: true));
      }
    });

    on<_ChangeCurrentIndex>(
      (event, emit) => emit(state.copyWith(currentIndex: event.value)),
    );
  }

  @override
  void saveCurruntPage(int newPageIndex) {
    add(NewsEvent.changeCurrentIndex(newPageIndex));
  }
}
