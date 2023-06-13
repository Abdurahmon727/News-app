// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NewsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getNews,
    required TResult Function(int index) changeTopic,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getNews,
    TResult? Function(int index)? changeTopic,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getNews,
    TResult Function(int index)? changeTopic,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetNews value) getNews,
    required TResult Function(_ChangeTopic value) changeTopic,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetNews value)? getNews,
    TResult? Function(_ChangeTopic value)? changeTopic,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetNews value)? getNews,
    TResult Function(_ChangeTopic value)? changeTopic,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsEventCopyWith<$Res> {
  factory $NewsEventCopyWith(NewsEvent value, $Res Function(NewsEvent) then) =
      _$NewsEventCopyWithImpl<$Res, NewsEvent>;
}

/// @nodoc
class _$NewsEventCopyWithImpl<$Res, $Val extends NewsEvent>
    implements $NewsEventCopyWith<$Res> {
  _$NewsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_GetNewsCopyWith<$Res> {
  factory _$$_GetNewsCopyWith(
          _$_GetNews value, $Res Function(_$_GetNews) then) =
      __$$_GetNewsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetNewsCopyWithImpl<$Res>
    extends _$NewsEventCopyWithImpl<$Res, _$_GetNews>
    implements _$$_GetNewsCopyWith<$Res> {
  __$$_GetNewsCopyWithImpl(_$_GetNews _value, $Res Function(_$_GetNews) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_GetNews implements _GetNews {
  const _$_GetNews();

  @override
  String toString() {
    return 'NewsEvent.getNews()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetNews);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getNews,
    required TResult Function(int index) changeTopic,
  }) {
    return getNews();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getNews,
    TResult? Function(int index)? changeTopic,
  }) {
    return getNews?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getNews,
    TResult Function(int index)? changeTopic,
    required TResult orElse(),
  }) {
    if (getNews != null) {
      return getNews();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetNews value) getNews,
    required TResult Function(_ChangeTopic value) changeTopic,
  }) {
    return getNews(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetNews value)? getNews,
    TResult? Function(_ChangeTopic value)? changeTopic,
  }) {
    return getNews?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetNews value)? getNews,
    TResult Function(_ChangeTopic value)? changeTopic,
    required TResult orElse(),
  }) {
    if (getNews != null) {
      return getNews(this);
    }
    return orElse();
  }
}

abstract class _GetNews implements NewsEvent {
  const factory _GetNews() = _$_GetNews;
}

/// @nodoc
abstract class _$$_ChangeTopicCopyWith<$Res> {
  factory _$$_ChangeTopicCopyWith(
          _$_ChangeTopic value, $Res Function(_$_ChangeTopic) then) =
      __$$_ChangeTopicCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$_ChangeTopicCopyWithImpl<$Res>
    extends _$NewsEventCopyWithImpl<$Res, _$_ChangeTopic>
    implements _$$_ChangeTopicCopyWith<$Res> {
  __$$_ChangeTopicCopyWithImpl(
      _$_ChangeTopic _value, $Res Function(_$_ChangeTopic) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$_ChangeTopic(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ChangeTopic implements _ChangeTopic {
  const _$_ChangeTopic(this.index);

  @override
  final int index;

  @override
  String toString() {
    return 'NewsEvent.changeTopic(index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeTopic &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeTopicCopyWith<_$_ChangeTopic> get copyWith =>
      __$$_ChangeTopicCopyWithImpl<_$_ChangeTopic>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getNews,
    required TResult Function(int index) changeTopic,
  }) {
    return changeTopic(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getNews,
    TResult? Function(int index)? changeTopic,
  }) {
    return changeTopic?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getNews,
    TResult Function(int index)? changeTopic,
    required TResult orElse(),
  }) {
    if (changeTopic != null) {
      return changeTopic(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetNews value) getNews,
    required TResult Function(_ChangeTopic value) changeTopic,
  }) {
    return changeTopic(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetNews value)? getNews,
    TResult? Function(_ChangeTopic value)? changeTopic,
  }) {
    return changeTopic?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetNews value)? getNews,
    TResult Function(_ChangeTopic value)? changeTopic,
    required TResult orElse(),
  }) {
    if (changeTopic != null) {
      return changeTopic(this);
    }
    return orElse();
  }
}

abstract class _ChangeTopic implements NewsEvent {
  const factory _ChangeTopic(final int index) = _$_ChangeTopic;

  int get index;
  @JsonKey(ignore: true)
  _$$_ChangeTopicCopyWith<_$_ChangeTopic> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NewsState {
  FormzStatus get status => throw _privateConstructorUsedError;
  List<NewsModel> get models => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  int get curruntPage => throw _privateConstructorUsedError;
  int get maxPage => throw _privateConstructorUsedError;
  int get tabIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewsStateCopyWith<NewsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsStateCopyWith<$Res> {
  factory $NewsStateCopyWith(NewsState value, $Res Function(NewsState) then) =
      _$NewsStateCopyWithImpl<$Res, NewsState>;
  @useResult
  $Res call(
      {FormzStatus status,
      List<NewsModel> models,
      String errorMessage,
      int curruntPage,
      int maxPage,
      int tabIndex});
}

/// @nodoc
class _$NewsStateCopyWithImpl<$Res, $Val extends NewsState>
    implements $NewsStateCopyWith<$Res> {
  _$NewsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? models = null,
    Object? errorMessage = null,
    Object? curruntPage = null,
    Object? maxPage = null,
    Object? tabIndex = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      models: null == models
          ? _value.models
          : models // ignore: cast_nullable_to_non_nullable
              as List<NewsModel>,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      curruntPage: null == curruntPage
          ? _value.curruntPage
          : curruntPage // ignore: cast_nullable_to_non_nullable
              as int,
      maxPage: null == maxPage
          ? _value.maxPage
          : maxPage // ignore: cast_nullable_to_non_nullable
              as int,
      tabIndex: null == tabIndex
          ? _value.tabIndex
          : tabIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NewsStateCopyWith<$Res> implements $NewsStateCopyWith<$Res> {
  factory _$$_NewsStateCopyWith(
          _$_NewsState value, $Res Function(_$_NewsState) then) =
      __$$_NewsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormzStatus status,
      List<NewsModel> models,
      String errorMessage,
      int curruntPage,
      int maxPage,
      int tabIndex});
}

/// @nodoc
class __$$_NewsStateCopyWithImpl<$Res>
    extends _$NewsStateCopyWithImpl<$Res, _$_NewsState>
    implements _$$_NewsStateCopyWith<$Res> {
  __$$_NewsStateCopyWithImpl(
      _$_NewsState _value, $Res Function(_$_NewsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? models = null,
    Object? errorMessage = null,
    Object? curruntPage = null,
    Object? maxPage = null,
    Object? tabIndex = null,
  }) {
    return _then(_$_NewsState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      models: null == models
          ? _value._models
          : models // ignore: cast_nullable_to_non_nullable
              as List<NewsModel>,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      curruntPage: null == curruntPage
          ? _value.curruntPage
          : curruntPage // ignore: cast_nullable_to_non_nullable
              as int,
      maxPage: null == maxPage
          ? _value.maxPage
          : maxPage // ignore: cast_nullable_to_non_nullable
              as int,
      tabIndex: null == tabIndex
          ? _value.tabIndex
          : tabIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_NewsState implements _NewsState {
  const _$_NewsState(
      {this.status = FormzStatus.pure,
      final List<NewsModel> models = const [],
      this.errorMessage = '',
      this.curruntPage = 1,
      this.maxPage = 1,
      this.tabIndex = 0})
      : _models = models;

  @override
  @JsonKey()
  final FormzStatus status;
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
  final String errorMessage;
  @override
  @JsonKey()
  final int curruntPage;
  @override
  @JsonKey()
  final int maxPage;
  @override
  @JsonKey()
  final int tabIndex;

  @override
  String toString() {
    return 'NewsState(status: $status, models: $models, errorMessage: $errorMessage, curruntPage: $curruntPage, maxPage: $maxPage, tabIndex: $tabIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NewsState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._models, _models) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.curruntPage, curruntPage) ||
                other.curruntPage == curruntPage) &&
            (identical(other.maxPage, maxPage) || other.maxPage == maxPage) &&
            (identical(other.tabIndex, tabIndex) ||
                other.tabIndex == tabIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_models),
      errorMessage,
      curruntPage,
      maxPage,
      tabIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NewsStateCopyWith<_$_NewsState> get copyWith =>
      __$$_NewsStateCopyWithImpl<_$_NewsState>(this, _$identity);
}

abstract class _NewsState implements NewsState {
  const factory _NewsState(
      {final FormzStatus status,
      final List<NewsModel> models,
      final String errorMessage,
      final int curruntPage,
      final int maxPage,
      final int tabIndex}) = _$_NewsState;

  @override
  FormzStatus get status;
  @override
  List<NewsModel> get models;
  @override
  String get errorMessage;
  @override
  int get curruntPage;
  @override
  int get maxPage;
  @override
  int get tabIndex;
  @override
  @JsonKey(ignore: true)
  _$$_NewsStateCopyWith<_$_NewsState> get copyWith =>
      throw _privateConstructorUsedError;
}
