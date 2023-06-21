// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_news_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SavedNewsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getNewsFromStorage,
    required TResult Function(NewsModel model) addOrRemove,
    required TResult Function() clear,
    required TResult Function(int newPageIndex) changeCurrentPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getNewsFromStorage,
    TResult? Function(NewsModel model)? addOrRemove,
    TResult? Function()? clear,
    TResult? Function(int newPageIndex)? changeCurrentPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getNewsFromStorage,
    TResult Function(NewsModel model)? addOrRemove,
    TResult Function()? clear,
    TResult Function(int newPageIndex)? changeCurrentPage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetNewsFromStorage value) getNewsFromStorage,
    required TResult Function(_AddOrRemove value) addOrRemove,
    required TResult Function(_Clear value) clear,
    required TResult Function(_ChangeCurrentPage value) changeCurrentPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetNewsFromStorage value)? getNewsFromStorage,
    TResult? Function(_AddOrRemove value)? addOrRemove,
    TResult? Function(_Clear value)? clear,
    TResult? Function(_ChangeCurrentPage value)? changeCurrentPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetNewsFromStorage value)? getNewsFromStorage,
    TResult Function(_AddOrRemove value)? addOrRemove,
    TResult Function(_Clear value)? clear,
    TResult Function(_ChangeCurrentPage value)? changeCurrentPage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavedNewsEventCopyWith<$Res> {
  factory $SavedNewsEventCopyWith(
          SavedNewsEvent value, $Res Function(SavedNewsEvent) then) =
      _$SavedNewsEventCopyWithImpl<$Res, SavedNewsEvent>;
}

/// @nodoc
class _$SavedNewsEventCopyWithImpl<$Res, $Val extends SavedNewsEvent>
    implements $SavedNewsEventCopyWith<$Res> {
  _$SavedNewsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_GetNewsFromStorageCopyWith<$Res> {
  factory _$$_GetNewsFromStorageCopyWith(_$_GetNewsFromStorage value,
          $Res Function(_$_GetNewsFromStorage) then) =
      __$$_GetNewsFromStorageCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetNewsFromStorageCopyWithImpl<$Res>
    extends _$SavedNewsEventCopyWithImpl<$Res, _$_GetNewsFromStorage>
    implements _$$_GetNewsFromStorageCopyWith<$Res> {
  __$$_GetNewsFromStorageCopyWithImpl(
      _$_GetNewsFromStorage _value, $Res Function(_$_GetNewsFromStorage) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_GetNewsFromStorage implements _GetNewsFromStorage {
  const _$_GetNewsFromStorage();

  @override
  String toString() {
    return 'SavedNewsEvent.getNewsFromStorage()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetNewsFromStorage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getNewsFromStorage,
    required TResult Function(NewsModel model) addOrRemove,
    required TResult Function() clear,
    required TResult Function(int newPageIndex) changeCurrentPage,
  }) {
    return getNewsFromStorage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getNewsFromStorage,
    TResult? Function(NewsModel model)? addOrRemove,
    TResult? Function()? clear,
    TResult? Function(int newPageIndex)? changeCurrentPage,
  }) {
    return getNewsFromStorage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getNewsFromStorage,
    TResult Function(NewsModel model)? addOrRemove,
    TResult Function()? clear,
    TResult Function(int newPageIndex)? changeCurrentPage,
    required TResult orElse(),
  }) {
    if (getNewsFromStorage != null) {
      return getNewsFromStorage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetNewsFromStorage value) getNewsFromStorage,
    required TResult Function(_AddOrRemove value) addOrRemove,
    required TResult Function(_Clear value) clear,
    required TResult Function(_ChangeCurrentPage value) changeCurrentPage,
  }) {
    return getNewsFromStorage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetNewsFromStorage value)? getNewsFromStorage,
    TResult? Function(_AddOrRemove value)? addOrRemove,
    TResult? Function(_Clear value)? clear,
    TResult? Function(_ChangeCurrentPage value)? changeCurrentPage,
  }) {
    return getNewsFromStorage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetNewsFromStorage value)? getNewsFromStorage,
    TResult Function(_AddOrRemove value)? addOrRemove,
    TResult Function(_Clear value)? clear,
    TResult Function(_ChangeCurrentPage value)? changeCurrentPage,
    required TResult orElse(),
  }) {
    if (getNewsFromStorage != null) {
      return getNewsFromStorage(this);
    }
    return orElse();
  }
}

abstract class _GetNewsFromStorage implements SavedNewsEvent {
  const factory _GetNewsFromStorage() = _$_GetNewsFromStorage;
}

/// @nodoc
abstract class _$$_AddOrRemoveCopyWith<$Res> {
  factory _$$_AddOrRemoveCopyWith(
          _$_AddOrRemove value, $Res Function(_$_AddOrRemove) then) =
      __$$_AddOrRemoveCopyWithImpl<$Res>;
  @useResult
  $Res call({NewsModel model});
}

/// @nodoc
class __$$_AddOrRemoveCopyWithImpl<$Res>
    extends _$SavedNewsEventCopyWithImpl<$Res, _$_AddOrRemove>
    implements _$$_AddOrRemoveCopyWith<$Res> {
  __$$_AddOrRemoveCopyWithImpl(
      _$_AddOrRemove _value, $Res Function(_$_AddOrRemove) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_$_AddOrRemove(
      null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as NewsModel,
    ));
  }
}

/// @nodoc

class _$_AddOrRemove implements _AddOrRemove {
  const _$_AddOrRemove(this.model);

  @override
  final NewsModel model;

  @override
  String toString() {
    return 'SavedNewsEvent.addOrRemove(model: $model)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddOrRemove &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddOrRemoveCopyWith<_$_AddOrRemove> get copyWith =>
      __$$_AddOrRemoveCopyWithImpl<_$_AddOrRemove>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getNewsFromStorage,
    required TResult Function(NewsModel model) addOrRemove,
    required TResult Function() clear,
    required TResult Function(int newPageIndex) changeCurrentPage,
  }) {
    return addOrRemove(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getNewsFromStorage,
    TResult? Function(NewsModel model)? addOrRemove,
    TResult? Function()? clear,
    TResult? Function(int newPageIndex)? changeCurrentPage,
  }) {
    return addOrRemove?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getNewsFromStorage,
    TResult Function(NewsModel model)? addOrRemove,
    TResult Function()? clear,
    TResult Function(int newPageIndex)? changeCurrentPage,
    required TResult orElse(),
  }) {
    if (addOrRemove != null) {
      return addOrRemove(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetNewsFromStorage value) getNewsFromStorage,
    required TResult Function(_AddOrRemove value) addOrRemove,
    required TResult Function(_Clear value) clear,
    required TResult Function(_ChangeCurrentPage value) changeCurrentPage,
  }) {
    return addOrRemove(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetNewsFromStorage value)? getNewsFromStorage,
    TResult? Function(_AddOrRemove value)? addOrRemove,
    TResult? Function(_Clear value)? clear,
    TResult? Function(_ChangeCurrentPage value)? changeCurrentPage,
  }) {
    return addOrRemove?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetNewsFromStorage value)? getNewsFromStorage,
    TResult Function(_AddOrRemove value)? addOrRemove,
    TResult Function(_Clear value)? clear,
    TResult Function(_ChangeCurrentPage value)? changeCurrentPage,
    required TResult orElse(),
  }) {
    if (addOrRemove != null) {
      return addOrRemove(this);
    }
    return orElse();
  }
}

abstract class _AddOrRemove implements SavedNewsEvent {
  const factory _AddOrRemove(final NewsModel model) = _$_AddOrRemove;

  NewsModel get model;
  @JsonKey(ignore: true)
  _$$_AddOrRemoveCopyWith<_$_AddOrRemove> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ClearCopyWith<$Res> {
  factory _$$_ClearCopyWith(_$_Clear value, $Res Function(_$_Clear) then) =
      __$$_ClearCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ClearCopyWithImpl<$Res>
    extends _$SavedNewsEventCopyWithImpl<$Res, _$_Clear>
    implements _$$_ClearCopyWith<$Res> {
  __$$_ClearCopyWithImpl(_$_Clear _value, $Res Function(_$_Clear) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Clear implements _Clear {
  const _$_Clear();

  @override
  String toString() {
    return 'SavedNewsEvent.clear()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Clear);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getNewsFromStorage,
    required TResult Function(NewsModel model) addOrRemove,
    required TResult Function() clear,
    required TResult Function(int newPageIndex) changeCurrentPage,
  }) {
    return clear();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getNewsFromStorage,
    TResult? Function(NewsModel model)? addOrRemove,
    TResult? Function()? clear,
    TResult? Function(int newPageIndex)? changeCurrentPage,
  }) {
    return clear?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getNewsFromStorage,
    TResult Function(NewsModel model)? addOrRemove,
    TResult Function()? clear,
    TResult Function(int newPageIndex)? changeCurrentPage,
    required TResult orElse(),
  }) {
    if (clear != null) {
      return clear();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetNewsFromStorage value) getNewsFromStorage,
    required TResult Function(_AddOrRemove value) addOrRemove,
    required TResult Function(_Clear value) clear,
    required TResult Function(_ChangeCurrentPage value) changeCurrentPage,
  }) {
    return clear(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetNewsFromStorage value)? getNewsFromStorage,
    TResult? Function(_AddOrRemove value)? addOrRemove,
    TResult? Function(_Clear value)? clear,
    TResult? Function(_ChangeCurrentPage value)? changeCurrentPage,
  }) {
    return clear?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetNewsFromStorage value)? getNewsFromStorage,
    TResult Function(_AddOrRemove value)? addOrRemove,
    TResult Function(_Clear value)? clear,
    TResult Function(_ChangeCurrentPage value)? changeCurrentPage,
    required TResult orElse(),
  }) {
    if (clear != null) {
      return clear(this);
    }
    return orElse();
  }
}

abstract class _Clear implements SavedNewsEvent {
  const factory _Clear() = _$_Clear;
}

/// @nodoc
abstract class _$$_ChangeCurrentPageCopyWith<$Res> {
  factory _$$_ChangeCurrentPageCopyWith(_$_ChangeCurrentPage value,
          $Res Function(_$_ChangeCurrentPage) then) =
      __$$_ChangeCurrentPageCopyWithImpl<$Res>;
  @useResult
  $Res call({int newPageIndex});
}

/// @nodoc
class __$$_ChangeCurrentPageCopyWithImpl<$Res>
    extends _$SavedNewsEventCopyWithImpl<$Res, _$_ChangeCurrentPage>
    implements _$$_ChangeCurrentPageCopyWith<$Res> {
  __$$_ChangeCurrentPageCopyWithImpl(
      _$_ChangeCurrentPage _value, $Res Function(_$_ChangeCurrentPage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newPageIndex = null,
  }) {
    return _then(_$_ChangeCurrentPage(
      null == newPageIndex
          ? _value.newPageIndex
          : newPageIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ChangeCurrentPage implements _ChangeCurrentPage {
  const _$_ChangeCurrentPage(this.newPageIndex);

  @override
  final int newPageIndex;

  @override
  String toString() {
    return 'SavedNewsEvent.changeCurrentPage(newPageIndex: $newPageIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeCurrentPage &&
            (identical(other.newPageIndex, newPageIndex) ||
                other.newPageIndex == newPageIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, newPageIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeCurrentPageCopyWith<_$_ChangeCurrentPage> get copyWith =>
      __$$_ChangeCurrentPageCopyWithImpl<_$_ChangeCurrentPage>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getNewsFromStorage,
    required TResult Function(NewsModel model) addOrRemove,
    required TResult Function() clear,
    required TResult Function(int newPageIndex) changeCurrentPage,
  }) {
    return changeCurrentPage(newPageIndex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getNewsFromStorage,
    TResult? Function(NewsModel model)? addOrRemove,
    TResult? Function()? clear,
    TResult? Function(int newPageIndex)? changeCurrentPage,
  }) {
    return changeCurrentPage?.call(newPageIndex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getNewsFromStorage,
    TResult Function(NewsModel model)? addOrRemove,
    TResult Function()? clear,
    TResult Function(int newPageIndex)? changeCurrentPage,
    required TResult orElse(),
  }) {
    if (changeCurrentPage != null) {
      return changeCurrentPage(newPageIndex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetNewsFromStorage value) getNewsFromStorage,
    required TResult Function(_AddOrRemove value) addOrRemove,
    required TResult Function(_Clear value) clear,
    required TResult Function(_ChangeCurrentPage value) changeCurrentPage,
  }) {
    return changeCurrentPage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetNewsFromStorage value)? getNewsFromStorage,
    TResult? Function(_AddOrRemove value)? addOrRemove,
    TResult? Function(_Clear value)? clear,
    TResult? Function(_ChangeCurrentPage value)? changeCurrentPage,
  }) {
    return changeCurrentPage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetNewsFromStorage value)? getNewsFromStorage,
    TResult Function(_AddOrRemove value)? addOrRemove,
    TResult Function(_Clear value)? clear,
    TResult Function(_ChangeCurrentPage value)? changeCurrentPage,
    required TResult orElse(),
  }) {
    if (changeCurrentPage != null) {
      return changeCurrentPage(this);
    }
    return orElse();
  }
}

abstract class _ChangeCurrentPage implements SavedNewsEvent {
  const factory _ChangeCurrentPage(final int newPageIndex) =
      _$_ChangeCurrentPage;

  int get newPageIndex;
  @JsonKey(ignore: true)
  _$$_ChangeCurrentPageCopyWith<_$_ChangeCurrentPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SavedNewsState {
  List<NewsModel> get models => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SavedNewsStateCopyWith<SavedNewsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavedNewsStateCopyWith<$Res> {
  factory $SavedNewsStateCopyWith(
          SavedNewsState value, $Res Function(SavedNewsState) then) =
      _$SavedNewsStateCopyWithImpl<$Res, SavedNewsState>;
  @useResult
  $Res call({List<NewsModel> models, int currentPage});
}

/// @nodoc
class _$SavedNewsStateCopyWithImpl<$Res, $Val extends SavedNewsState>
    implements $SavedNewsStateCopyWith<$Res> {
  _$SavedNewsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? models = null,
    Object? currentPage = null,
  }) {
    return _then(_value.copyWith(
      models: null == models
          ? _value.models
          : models // ignore: cast_nullable_to_non_nullable
              as List<NewsModel>,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SavedNewsStateCopyWith<$Res>
    implements $SavedNewsStateCopyWith<$Res> {
  factory _$$_SavedNewsStateCopyWith(
          _$_SavedNewsState value, $Res Function(_$_SavedNewsState) then) =
      __$$_SavedNewsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<NewsModel> models, int currentPage});
}

/// @nodoc
class __$$_SavedNewsStateCopyWithImpl<$Res>
    extends _$SavedNewsStateCopyWithImpl<$Res, _$_SavedNewsState>
    implements _$$_SavedNewsStateCopyWith<$Res> {
  __$$_SavedNewsStateCopyWithImpl(
      _$_SavedNewsState _value, $Res Function(_$_SavedNewsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? models = null,
    Object? currentPage = null,
  }) {
    return _then(_$_SavedNewsState(
      models: null == models
          ? _value._models
          : models // ignore: cast_nullable_to_non_nullable
              as List<NewsModel>,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_SavedNewsState implements _SavedNewsState {
  const _$_SavedNewsState(
      {final List<NewsModel> models = const [], this.currentPage = 0})
      : _models = models;

  final List<NewsModel> _models;
  @override
  @JsonKey()
  List<NewsModel> get models {
    if (_models is EqualUnmodifiableListView) return _models;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_models);
  }

  @override
  @JsonKey()
  final int currentPage;

  @override
  String toString() {
    return 'SavedNewsState(models: $models, currentPage: $currentPage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SavedNewsState &&
            const DeepCollectionEquality().equals(other._models, _models) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_models), currentPage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SavedNewsStateCopyWith<_$_SavedNewsState> get copyWith =>
      __$$_SavedNewsStateCopyWithImpl<_$_SavedNewsState>(this, _$identity);
}

abstract class _SavedNewsState implements SavedNewsState {
  const factory _SavedNewsState(
      {final List<NewsModel> models,
      final int currentPage}) = _$_SavedNewsState;

  @override
  List<NewsModel> get models;
  @override
  int get currentPage;
  @override
  @JsonKey(ignore: true)
  _$$_SavedNewsStateCopyWith<_$_SavedNewsState> get copyWith =>
      throw _privateConstructorUsedError;
}
