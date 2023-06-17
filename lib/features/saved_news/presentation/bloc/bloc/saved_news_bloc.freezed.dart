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
    required TResult Function(NewsModel model) addOneNews,
    required TResult Function(NewsModel model) removeOneNews,
    required TResult Function() clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getNewsFromStorage,
    TResult? Function(NewsModel model)? addOneNews,
    TResult? Function(NewsModel model)? removeOneNews,
    TResult? Function()? clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getNewsFromStorage,
    TResult Function(NewsModel model)? addOneNews,
    TResult Function(NewsModel model)? removeOneNews,
    TResult Function()? clear,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetNewsFromStorage value) getNewsFromStorage,
    required TResult Function(_AddOneNews value) addOneNews,
    required TResult Function(_RemoveOneNews value) removeOneNews,
    required TResult Function(_Clear value) clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetNewsFromStorage value)? getNewsFromStorage,
    TResult? Function(_AddOneNews value)? addOneNews,
    TResult? Function(_RemoveOneNews value)? removeOneNews,
    TResult? Function(_Clear value)? clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetNewsFromStorage value)? getNewsFromStorage,
    TResult Function(_AddOneNews value)? addOneNews,
    TResult Function(_RemoveOneNews value)? removeOneNews,
    TResult Function(_Clear value)? clear,
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
    required TResult Function(NewsModel model) addOneNews,
    required TResult Function(NewsModel model) removeOneNews,
    required TResult Function() clear,
  }) {
    return getNewsFromStorage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getNewsFromStorage,
    TResult? Function(NewsModel model)? addOneNews,
    TResult? Function(NewsModel model)? removeOneNews,
    TResult? Function()? clear,
  }) {
    return getNewsFromStorage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getNewsFromStorage,
    TResult Function(NewsModel model)? addOneNews,
    TResult Function(NewsModel model)? removeOneNews,
    TResult Function()? clear,
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
    required TResult Function(_AddOneNews value) addOneNews,
    required TResult Function(_RemoveOneNews value) removeOneNews,
    required TResult Function(_Clear value) clear,
  }) {
    return getNewsFromStorage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetNewsFromStorage value)? getNewsFromStorage,
    TResult? Function(_AddOneNews value)? addOneNews,
    TResult? Function(_RemoveOneNews value)? removeOneNews,
    TResult? Function(_Clear value)? clear,
  }) {
    return getNewsFromStorage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetNewsFromStorage value)? getNewsFromStorage,
    TResult Function(_AddOneNews value)? addOneNews,
    TResult Function(_RemoveOneNews value)? removeOneNews,
    TResult Function(_Clear value)? clear,
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
abstract class _$$_AddOneNewsCopyWith<$Res> {
  factory _$$_AddOneNewsCopyWith(
          _$_AddOneNews value, $Res Function(_$_AddOneNews) then) =
      __$$_AddOneNewsCopyWithImpl<$Res>;
  @useResult
  $Res call({NewsModel model});
}

/// @nodoc
class __$$_AddOneNewsCopyWithImpl<$Res>
    extends _$SavedNewsEventCopyWithImpl<$Res, _$_AddOneNews>
    implements _$$_AddOneNewsCopyWith<$Res> {
  __$$_AddOneNewsCopyWithImpl(
      _$_AddOneNews _value, $Res Function(_$_AddOneNews) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_$_AddOneNews(
      null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as NewsModel,
    ));
  }
}

/// @nodoc

class _$_AddOneNews implements _AddOneNews {
  const _$_AddOneNews(this.model);

  @override
  final NewsModel model;

  @override
  String toString() {
    return 'SavedNewsEvent.addOneNews(model: $model)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddOneNews &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddOneNewsCopyWith<_$_AddOneNews> get copyWith =>
      __$$_AddOneNewsCopyWithImpl<_$_AddOneNews>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getNewsFromStorage,
    required TResult Function(NewsModel model) addOneNews,
    required TResult Function(NewsModel model) removeOneNews,
    required TResult Function() clear,
  }) {
    return addOneNews(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getNewsFromStorage,
    TResult? Function(NewsModel model)? addOneNews,
    TResult? Function(NewsModel model)? removeOneNews,
    TResult? Function()? clear,
  }) {
    return addOneNews?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getNewsFromStorage,
    TResult Function(NewsModel model)? addOneNews,
    TResult Function(NewsModel model)? removeOneNews,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (addOneNews != null) {
      return addOneNews(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetNewsFromStorage value) getNewsFromStorage,
    required TResult Function(_AddOneNews value) addOneNews,
    required TResult Function(_RemoveOneNews value) removeOneNews,
    required TResult Function(_Clear value) clear,
  }) {
    return addOneNews(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetNewsFromStorage value)? getNewsFromStorage,
    TResult? Function(_AddOneNews value)? addOneNews,
    TResult? Function(_RemoveOneNews value)? removeOneNews,
    TResult? Function(_Clear value)? clear,
  }) {
    return addOneNews?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetNewsFromStorage value)? getNewsFromStorage,
    TResult Function(_AddOneNews value)? addOneNews,
    TResult Function(_RemoveOneNews value)? removeOneNews,
    TResult Function(_Clear value)? clear,
    required TResult orElse(),
  }) {
    if (addOneNews != null) {
      return addOneNews(this);
    }
    return orElse();
  }
}

abstract class _AddOneNews implements SavedNewsEvent {
  const factory _AddOneNews(final NewsModel model) = _$_AddOneNews;

  NewsModel get model;
  @JsonKey(ignore: true)
  _$$_AddOneNewsCopyWith<_$_AddOneNews> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RemoveOneNewsCopyWith<$Res> {
  factory _$$_RemoveOneNewsCopyWith(
          _$_RemoveOneNews value, $Res Function(_$_RemoveOneNews) then) =
      __$$_RemoveOneNewsCopyWithImpl<$Res>;
  @useResult
  $Res call({NewsModel model});
}

/// @nodoc
class __$$_RemoveOneNewsCopyWithImpl<$Res>
    extends _$SavedNewsEventCopyWithImpl<$Res, _$_RemoveOneNews>
    implements _$$_RemoveOneNewsCopyWith<$Res> {
  __$$_RemoveOneNewsCopyWithImpl(
      _$_RemoveOneNews _value, $Res Function(_$_RemoveOneNews) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_$_RemoveOneNews(
      null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as NewsModel,
    ));
  }
}

/// @nodoc

class _$_RemoveOneNews implements _RemoveOneNews {
  const _$_RemoveOneNews(this.model);

  @override
  final NewsModel model;

  @override
  String toString() {
    return 'SavedNewsEvent.removeOneNews(model: $model)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RemoveOneNews &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RemoveOneNewsCopyWith<_$_RemoveOneNews> get copyWith =>
      __$$_RemoveOneNewsCopyWithImpl<_$_RemoveOneNews>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getNewsFromStorage,
    required TResult Function(NewsModel model) addOneNews,
    required TResult Function(NewsModel model) removeOneNews,
    required TResult Function() clear,
  }) {
    return removeOneNews(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getNewsFromStorage,
    TResult? Function(NewsModel model)? addOneNews,
    TResult? Function(NewsModel model)? removeOneNews,
    TResult? Function()? clear,
  }) {
    return removeOneNews?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getNewsFromStorage,
    TResult Function(NewsModel model)? addOneNews,
    TResult Function(NewsModel model)? removeOneNews,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (removeOneNews != null) {
      return removeOneNews(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetNewsFromStorage value) getNewsFromStorage,
    required TResult Function(_AddOneNews value) addOneNews,
    required TResult Function(_RemoveOneNews value) removeOneNews,
    required TResult Function(_Clear value) clear,
  }) {
    return removeOneNews(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetNewsFromStorage value)? getNewsFromStorage,
    TResult? Function(_AddOneNews value)? addOneNews,
    TResult? Function(_RemoveOneNews value)? removeOneNews,
    TResult? Function(_Clear value)? clear,
  }) {
    return removeOneNews?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetNewsFromStorage value)? getNewsFromStorage,
    TResult Function(_AddOneNews value)? addOneNews,
    TResult Function(_RemoveOneNews value)? removeOneNews,
    TResult Function(_Clear value)? clear,
    required TResult orElse(),
  }) {
    if (removeOneNews != null) {
      return removeOneNews(this);
    }
    return orElse();
  }
}

abstract class _RemoveOneNews implements SavedNewsEvent {
  const factory _RemoveOneNews(final NewsModel model) = _$_RemoveOneNews;

  NewsModel get model;
  @JsonKey(ignore: true)
  _$$_RemoveOneNewsCopyWith<_$_RemoveOneNews> get copyWith =>
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
    required TResult Function(NewsModel model) addOneNews,
    required TResult Function(NewsModel model) removeOneNews,
    required TResult Function() clear,
  }) {
    return clear();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getNewsFromStorage,
    TResult? Function(NewsModel model)? addOneNews,
    TResult? Function(NewsModel model)? removeOneNews,
    TResult? Function()? clear,
  }) {
    return clear?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getNewsFromStorage,
    TResult Function(NewsModel model)? addOneNews,
    TResult Function(NewsModel model)? removeOneNews,
    TResult Function()? clear,
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
    required TResult Function(_AddOneNews value) addOneNews,
    required TResult Function(_RemoveOneNews value) removeOneNews,
    required TResult Function(_Clear value) clear,
  }) {
    return clear(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetNewsFromStorage value)? getNewsFromStorage,
    TResult? Function(_AddOneNews value)? addOneNews,
    TResult? Function(_RemoveOneNews value)? removeOneNews,
    TResult? Function(_Clear value)? clear,
  }) {
    return clear?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetNewsFromStorage value)? getNewsFromStorage,
    TResult Function(_AddOneNews value)? addOneNews,
    TResult Function(_RemoveOneNews value)? removeOneNews,
    TResult Function(_Clear value)? clear,
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
mixin _$SavedNewsState {
  List<NewsModel> get models => throw _privateConstructorUsedError;

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
  $Res call({List<NewsModel> models});
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
  }) {
    return _then(_value.copyWith(
      models: null == models
          ? _value.models
          : models // ignore: cast_nullable_to_non_nullable
              as List<NewsModel>,
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
  $Res call({List<NewsModel> models});
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
  }) {
    return _then(_$_SavedNewsState(
      models: null == models
          ? _value._models
          : models // ignore: cast_nullable_to_non_nullable
              as List<NewsModel>,
    ));
  }
}

/// @nodoc

class _$_SavedNewsState implements _SavedNewsState {
  const _$_SavedNewsState({final List<NewsModel> models = const []})
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
  String toString() {
    return 'SavedNewsState(models: $models)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SavedNewsState &&
            const DeepCollectionEquality().equals(other._models, _models));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_models));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SavedNewsStateCopyWith<_$_SavedNewsState> get copyWith =>
      __$$_SavedNewsStateCopyWithImpl<_$_SavedNewsState>(this, _$identity);
}

abstract class _SavedNewsState implements SavedNewsState {
  const factory _SavedNewsState({final List<NewsModel> models}) =
      _$_SavedNewsState;

  @override
  List<NewsModel> get models;
  @override
  @JsonKey(ignore: true)
  _$$_SavedNewsStateCopyWith<_$_SavedNewsState> get copyWith =>
      throw _privateConstructorUsedError;
}
