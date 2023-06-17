part of 'saved_news_bloc.dart';

@freezed
class SavedNewsEvent with _$SavedNewsEvent {
  const factory SavedNewsEvent.getNewsFromStorage() = _GetNewsFromStorage;

  const factory SavedNewsEvent.addOrRemove(NewsModel model) = _AddOrRemove;
  const factory SavedNewsEvent.clear() = _Clear;
}
