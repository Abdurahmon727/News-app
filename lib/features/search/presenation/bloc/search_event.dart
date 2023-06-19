part of 'search_bloc.dart';

@freezed
class SearchEvent with _$SearchEvent {
  const factory SearchEvent.search(String query) = _Search;
  const factory SearchEvent.changeCurrentCardPage(int index) =
      _ChangeCurrentPageIndex;
}
