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
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getNewsFromStorage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getNewsFromStorage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetNewsFromStorage value) getNewsFromStorage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetNewsFromStorage value)? getNewsFromStorage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetNewsFromStorage value)? getNewsFromStorage,
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
  }) {
    return getNewsFromStorage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getNewsFromStorage,
  }) {
    return getNewsFromStorage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getNewsFromStorage,
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
  }) {
    return getNewsFromStorage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetNewsFromStorage value)? getNewsFromStorage,
  }) {
    return getNewsFromStorage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetNewsFromStorage value)? getNewsFromStorage,
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
mixin _$SavedNewsState {
  List<NewsModel> get savedNews => throw _privateConstructorUsedError;

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
  $Res call({List<NewsModel> savedNews});
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
    Object? savedNews = null,
  }) {
    return _then(_value.copyWith(
      savedNews: null == savedNews
          ? _value.savedNews
          : savedNews // ignore: cast_nullable_to_non_nullable
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
  $Res call({List<NewsModel> savedNews});
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
    Object? savedNews = null,
  }) {
    return _then(_$_SavedNewsState(
      savedNews: null == savedNews
          ? _value._savedNews
          : savedNews // ignore: cast_nullable_to_non_nullable
              as List<NewsModel>,
    ));
  }
}

/// @nodoc

class _$_SavedNewsState implements _SavedNewsState {
  const _$_SavedNewsState({final List<NewsModel> savedNews = const []})
      : _savedNews = savedNews;

  final List<NewsModel> _savedNews;
  @override
  @JsonKey()
  List<NewsModel> get savedNews {
    if (_savedNews is EqualUnmodifiableListView) return _savedNews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_savedNews);
  }

  @override
  String toString() {
    return 'SavedNewsState(savedNews: $savedNews)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SavedNewsState &&
            const DeepCollectionEquality()
                .equals(other._savedNews, _savedNews));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_savedNews));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SavedNewsStateCopyWith<_$_SavedNewsState> get copyWith =>
      __$$_SavedNewsStateCopyWithImpl<_$_SavedNewsState>(this, _$identity);
}

abstract class _SavedNewsState implements SavedNewsState {
  const factory _SavedNewsState({final List<NewsModel> savedNews}) =
      _$_SavedNewsState;

  @override
  List<NewsModel> get savedNews;
  @override
  @JsonKey(ignore: true)
  _$$_SavedNewsStateCopyWith<_$_SavedNewsState> get copyWith =>
      throw _privateConstructorUsedError;
}
