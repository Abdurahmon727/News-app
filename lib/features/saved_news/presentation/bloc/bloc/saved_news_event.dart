part of 'saved_news_bloc.dart';

@freezed
class SavedNewsEvent with _$SavedNewsEvent {
  const factory SavedNewsEvent.getNewsFromStorage() = _GetNewsFromStorage;
}
