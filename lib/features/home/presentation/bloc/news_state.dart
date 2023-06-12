part of 'news_bloc.dart';

@freezed
class NewsState with _$NewsState {
  const factory NewsState({
    @Default(FormzStatus.pure) FormzStatus status,
    @Default([]) List<NewsModel> models,
    @Default('') String errorMessage,
    @Default(1) int curruntPage,
    @Default(1) int maxPage,
  }) = _NewsState;
}
