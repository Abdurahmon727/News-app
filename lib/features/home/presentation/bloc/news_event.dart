part of 'news_bloc.dart';

@freezed
class NewsEvent with _$NewsEvent {
  const factory NewsEvent.getNews() = _GetNews;
  const factory NewsEvent.changeTopic(int index) = _ChangeTopic;
  const factory NewsEvent.applyFilter({
    required Calendar calendar,
    required List<String> languages,
    required List<String> sources,
  }) = _ApplyFilter;
  const factory NewsEvent.changeCurrentIndex(int value) = _ChangeCurrentIndex;
  const factory NewsEvent.init() = _Init;
  const factory NewsEvent.changeTopics(List<String> topics) = _ChangeTopics;
}
