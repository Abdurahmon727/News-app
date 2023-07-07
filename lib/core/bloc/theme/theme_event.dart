part of 'theme_bloc.dart';

@freezed
class ThemeEvent with _$ThemeEvent {
  const factory ThemeEvent.load() = _LoadTheme;
  const factory ThemeEvent.changeTheme() = _ChangeTheme;
  const factory ThemeEvent.changeUseSystemTheme() = _ChangeUseSystemTheme;
  const factory ThemeEvent.changePrimaryColorIndex(int index) =
      _ChangePrimaryColorIndex;
  const factory ThemeEvent.changeView() = _ChangeView;
}
