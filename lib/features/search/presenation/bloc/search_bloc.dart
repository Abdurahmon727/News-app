import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/formz/formz_status.dart';
import '../../../home/data/models/news.dart';
import '../../../home/presentation/bloc/page_save.dart';
import '../../data/repository/search_repo.dart';
import '../../domain/repository/search_repo.dart';

part 'search_bloc.freezed.dart';
part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState>
    implements CurrentPageSavable {
  SearchBloc() : super(const _SearchState()) {
    on<_Search>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final SearchRepository repo = SearchRepositoryImpl();
      final int page =
          (state.query == event.query && state.maxPage > state.currentPage)
              ? state.currentPage + 1
              : 1;
      final result = await repo.getSearchResults(event.query, page);
      result.either((error) {
        emit(state.copyWith(
          status: FormzStatus.submissionFailure,
          errorMessage: error.errorMessage,
          currentCardIndex: 0,
        ));
      }, (data) {
        emit(state.copyWith(
          query: event.query,
          status: FormzStatus.submissionSuccess,
          resultModels: data.$1,
          currentPage: page,
          maxPage: data.$2,
          currentCardIndex: 0,
        ));
      });
    });

    on<_ChangeCurrentPageIndex>((event, emit) {
      emit(state.copyWith(currentCardIndex: event.index));
    });
  }

  @override
  void saveCurruntPage(int newPageIndex) {
    add(SearchEvent.changeCurrentCardPage(newPageIndex));
  }
}
