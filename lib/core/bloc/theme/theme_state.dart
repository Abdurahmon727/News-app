part of 'theme_bloc.dart';

@freezed
class ThemeState with _$ThemeState {
  const factory ThemeState({
    @Default(true) bool isLight,
    @Default(true) bool isCardView,
  }) = _ThemeState;
}
