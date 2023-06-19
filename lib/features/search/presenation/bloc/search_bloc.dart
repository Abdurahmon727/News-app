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
      final SearchRepository _repo = SearchRepositoryImpl();
      final result = await _repo.getSearchResults(event.query);
      result.either((error) {
        emit(state.copyWith(
          status: FormzStatus.submissionFailure,
          errorMessage: error.errorMessage,
        ));
      }, (data) {
        emit(state.copyWith(
          status: FormzStatus.submissionSuccess,
          resultModels: data,
        ));
      });
    });

    on<_ChangeCurrentPageIndex>((event, emit) {
      emit(state.copyWith(currentCardIndex: event.index));
    });
  }

  @override
  void saveCurruntPage(int newPageIndex) {
    add(_ChangeCurrentPageIndex(newPageIndex));
  }
}
