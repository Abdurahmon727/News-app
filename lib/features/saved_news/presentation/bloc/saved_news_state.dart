part of 'saved_news_bloc.dart';

@freezed
class SavedNewsState with _$SavedNewsState {
  const factory SavedNewsState({
    @Default([]) List<NewsModel> models,
    @Default(0) int currentPage,
  }) = _SavedNewsState;
}
