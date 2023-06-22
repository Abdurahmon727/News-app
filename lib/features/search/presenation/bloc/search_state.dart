part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    @Default(FormzStatus.pure) FormzStatus status,
    @Default('') String query,
    @Default([]) List<NewsModel> resultModels,
    @Default(1) int currentPage,
    @Default(1) int maxPage,
    @Default('') String errorMessage,
    @Default(0) int currentCardIndex,
  }) = _SearchState;
}
