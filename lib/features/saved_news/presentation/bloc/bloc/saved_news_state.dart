part of 'saved_news_bloc.dart';

@freezed
class SavedNewsState with _$SavedNewsState {
  const factory SavedNewsState({
    @Default([]) List<NewsModel> savedNews,
  }) = _SavedNewsState;
}
