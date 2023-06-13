part of 'news_bloc.dart';

@freezed
class NewsEvent with _$NewsEvent {
  const factory NewsEvent.getNews() = _GetNews;
  const factory NewsEvent.changeTopic(int index) = _ChangeTopic;
}
