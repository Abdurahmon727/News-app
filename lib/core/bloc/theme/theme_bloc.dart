import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/storage_repository.dart';

part 'theme_bloc.freezed.dart';
part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeState()) {
    on<_ChangeTheme>((event, emit) async {
      await StorageRepository.putBool(
        key: 'app_theme_light',
        value: !state.isLight,
      );
      emit(state.copyWith(isLight: !state.isLight));
    });

    on<_ChangeView>((event, emit) async {
      await StorageRepository.putBool(
        key: 'app_view_card',
        value: !state.isCardView,
      );
      emit(state.copyWith(isCardView: !state.isCardView));
    });

    on<_ChangeUseSystemTheme>((event, emit) async {
      await StorageRepository.putBool(
        key: 'app_theme_system',
        value: !state.useSystemTheme,
      );
      emit(state.copyWith(useSystemTheme: !state.useSystemTheme));
    });

    on<_ChangePrimaryColorIndex>((event, emit) async {
      emit(state.copyWith(primaryColorIndex: event.index));
      await StorageRepository.putInt(
        key: 'app_theme_primary_color_index',
        value: state.primaryColorIndex,
      );
    });

    on<_LoadTheme>((event, emit) async {
      final useSystemTheme = StorageRepository.getBool(
        'app_theme_system',
        defValue: true,
      );

      final isLight = StorageRepository.getBool(
        'app_theme_light',
        defValue: true,
      );
      final isCardView = StorageRepository.getBool(
        'app_view_card',
        defValue: true,
      );
      final primaryColorIndex = StorageRepository.getInt(
          'app_theme_primary_color_index',
          defValue: 0);
      emit(state.copyWith(
        primaryColorIndex: primaryColorIndex,
        isLight: isLight,
        isCardView: isCardView,
        useSystemTheme: useSystemTheme,
      ));
    });
  }
}
