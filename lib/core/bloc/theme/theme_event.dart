part of 'theme_bloc.dart';

@freezed
class ThemeEvent with _$ThemeEvent {
  const factory ThemeEvent.load() = _LoadTheme;
  const factory ThemeEvent.changeTheme({required bool isLight}) = _ChangeTheme;
  const factory ThemeEvent.changeView({required bool isCardView}) = _ChangeView;
}
