// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) search,
    required TResult Function(int index) changeCurrentCardPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? search,
    TResult? Function(int index)? changeCurrentCardPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? search,
    TResult Function(int index)? changeCurrentCardPage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Search value) search,
    required TResult Function(_ChangeCurrentPageIndex value)
        changeCurrentCardPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Search value)? search,
    TResult? Function(_ChangeCurrentPageIndex value)? changeCurrentCardPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Search value)? search,
    TResult Function(_ChangeCurrentPageIndex value)? changeCurrentCardPage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchEventCopyWith<$Res> {
  factory $SearchEventCopyWith(
          SearchEvent value, $Res Function(SearchEvent) then) =
      _$SearchEventCopyWithImpl<$Res, SearchEvent>;
}

/// @nodoc
class _$SearchEventCopyWithImpl<$Res, $Val extends SearchEvent>
    implements $SearchEventCopyWith<$Res> {
  _$SearchEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_SearchCopyWith<$Res> {
  factory _$$_SearchCopyWith(_$_Search value, $Res Function(_$_Search) then) =
      __$$_SearchCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$_SearchCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$_Search>
    implements _$$_SearchCopyWith<$Res> {
  __$$_SearchCopyWithImpl(_$_Search _value, $Res Function(_$_Search) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$_Search(
      null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Search implements _Search {
  const _$_Search(this.query);

  @override
  final String query;

  @override
  String toString() {
    return 'SearchEvent.search(query: $query)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Search &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchCopyWith<_$_Search> get copyWith =>
      __$$_SearchCopyWithImpl<_$_Search>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) search,
    required TResult Function(int index) changeCurrentCardPage,
  }) {
    return search(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? search,
    TResult? Function(int index)? changeCurrentCardPage,
  }) {
    return search?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? search,
    TResult Function(int index)? changeCurrentCardPage,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Search value) search,
    required TResult Function(_ChangeCurrentPageIndex value)
        changeCurrentCardPage,
  }) {
    return search(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Search value)? search,
    TResult? Function(_ChangeCurrentPageIndex value)? changeCurrentCardPage,
  }) {
    return search?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Search value)? search,
    TResult Function(_ChangeCurrentPageIndex value)? changeCurrentCardPage,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(this);
    }
    return orElse();
  }
}

abstract class _Search implements SearchEvent {
  const factory _Search(final String query) = _$_Search;

  String get query;
  @JsonKey(ignore: true)
  _$$_SearchCopyWith<_$_Search> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ChangeCurrentPageIndexCopyWith<$Res> {
  factory _$$_ChangeCurrentPageIndexCopyWith(_$_ChangeCurrentPageIndex value,
          $Res Function(_$_ChangeCurrentPageIndex) then) =
      __$$_ChangeCurrentPageIndexCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$_ChangeCurrentPageIndexCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$_ChangeCurrentPageIndex>
    implements _$$_ChangeCurrentPageIndexCopyWith<$Res> {
  __$$_ChangeCurrentPageIndexCopyWithImpl(_$_ChangeCurrentPageIndex _value,
      $Res Function(_$_ChangeCurrentPageIndex) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$_ChangeCurrentPageIndex(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ChangeCurrentPageIndex implements _ChangeCurrentPageIndex {
  const _$_ChangeCurrentPageIndex(this.index);

  @override
  final int index;

  @override
  String toString() {
    return 'SearchEvent.changeCurrentCardPage(index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeCurrentPageIndex &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeCurrentPageIndexCopyWith<_$_ChangeCurrentPageIndex> get copyWith =>
      __$$_ChangeCurrentPageIndexCopyWithImpl<_$_ChangeCurrentPageIndex>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) search,
    required TResult Function(int index) changeCurrentCardPage,
  }) {
    return changeCurrentCardPage(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? search,
    TResult? Function(int index)? changeCurrentCardPage,
  }) {
    return changeCurrentCardPage?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? search,
    TResult Function(int index)? changeCurrentCardPage,
    required TResult orElse(),
  }) {
    if (changeCurrentCardPage != null) {
      return changeCurrentCardPage(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Search value) search,
    required TResult Function(_ChangeCurrentPageIndex value)
        changeCurrentCardPage,
  }) {
    return changeCurrentCardPage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Search value)? search,
    TResult? Function(_ChangeCurrentPageIndex value)? changeCurrentCardPage,
  }) {
    return changeCurrentCardPage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Search value)? search,
    TResult Function(_ChangeCurrentPageIndex value)? changeCurrentCardPage,
    required TResult orElse(),
  }) {
    if (changeCurrentCardPage != null) {
      return changeCurrentCardPage(this);
    }
    return orElse();
  }
}

abstract class _ChangeCurrentPageIndex implements SearchEvent {
  const factory _ChangeCurrentPageIndex(final int index) =
      _$_ChangeCurrentPageIndex;

  int get index;
  @JsonKey(ignore: true)
  _$$_ChangeCurrentPageIndexCopyWith<_$_ChangeCurrentPageIndex> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SearchState {
  FormzStatus get status => throw _privateConstructorUsedError;
  List<NewsModel> get resultModels => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  int get maxPage => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  int get currentCardIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchStateCopyWith<SearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
          SearchState value, $Res Function(SearchState) then) =
      _$SearchStateCopyWithImpl<$Res, SearchState>;
  @useResult
  $Res call(
      {FormzStatus status,
      List<NewsModel> resultModels,
      int currentPage,
      int maxPage,
      String errorMessage,
      int currentCardIndex});
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res, $Val extends SearchState>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? resultModels = null,
    Object? currentPage = null,
    Object? maxPage = null,
    Object? errorMessage = null,
    Object? currentCardIndex = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      resultModels: null == resultModels
          ? _value.resultModels
          : resultModels // ignore: cast_nullable_to_non_nullable
              as List<NewsModel>,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      maxPage: null == maxPage
          ? _value.maxPage
          : maxPage // ignore: cast_nullable_to_non_nullable
              as int,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      currentCardIndex: null == currentCardIndex
          ? _value.currentCardIndex
          : currentCardIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SearchStateCopyWith<$Res>
    implements $SearchStateCopyWith<$Res> {
  factory _$$_SearchStateCopyWith(
          _$_SearchState value, $Res Function(_$_SearchState) then) =
      __$$_SearchStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormzStatus status,
      List<NewsModel> resultModels,
      int currentPage,
      int maxPage,
      String errorMessage,
      int currentCardIndex});
}

/// @nodoc
class __$$_SearchStateCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$_SearchState>
    implements _$$_SearchStateCopyWith<$Res> {
  __$$_SearchStateCopyWithImpl(
      _$_SearchState _value, $Res Function(_$_SearchState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? resultModels = null,
    Object? currentPage = null,
    Object? maxPage = null,
    Object? errorMessage = null,
    Object? currentCardIndex = null,
  }) {
    return _then(_$_SearchState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      resultModels: null == resultModels
          ? _value._resultModels
          : resultModels // ignore: cast_nullable_to_non_nullable
              as List<NewsModel>,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      maxPage: null == maxPage
          ? _value.maxPage
          : maxPage // ignore: cast_nullable_to_non_nullable
              as int,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      currentCardIndex: null == currentCardIndex
          ? _value.currentCardIndex
          : currentCardIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_SearchState implements _SearchState {
  const _$_SearchState(
      {this.status = FormzStatus.pure,
      final List<NewsModel> resultModels = const [],
      this.currentPage = 1,
      this.maxPage = 1,
      this.errorMessage = '',
      this.currentCardIndex = 0})
      : _resultModels = resultModels;

  @override
  @JsonKey()
  final FormzStatus status;
  final List<NewsModel> _resultModels;
  @override
  @JsonKey()
  List<NewsModel> get resultModels {
    if (_resultModels is EqualUnmodifiableListView) return _resultModels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_resultModels);
  }

  @override
  @JsonKey()
  final int currentPage;
  @override
  @JsonKey()
  final int maxPage;
  @override
  @JsonKey()
  final String errorMessage;
  @override
  @JsonKey()
  final int currentCardIndex;

  @override
  String toString() {
    return 'SearchState(status: $status, resultModels: $resultModels, currentPage: $currentPage, maxPage: $maxPage, errorMessage: $errorMessage, currentCardIndex: $currentCardIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._resultModels, _resultModels) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.maxPage, maxPage) || other.maxPage == maxPage) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.currentCardIndex, currentCardIndex) ||
                other.currentCardIndex == currentCardIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_resultModels),
      currentPage,
      maxPage,
      errorMessage,
      currentCardIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchStateCopyWith<_$_SearchState> get copyWith =>
      __$$_SearchStateCopyWithImpl<_$_SearchState>(this, _$identity);
}

abstract class _SearchState implements SearchState {
  const factory _SearchState(
      {final FormzStatus status,
      final List<NewsModel> resultModels,
      final int currentPage,
      final int maxPage,
      final String errorMessage,
      final int currentCardIndex}) = _$_SearchState;

  @override
  FormzStatus get status;
  @override
  List<NewsModel> get resultModels;
  @override
  int get currentPage;
  @override
  int get maxPage;
  @override
  String get errorMessage;
  @override
  int get currentCardIndex;
  @override
  @JsonKey(ignore: true)
  _$$_SearchStateCopyWith<_$_SearchState> get copyWith =>
      throw _privateConstructorUsedError;
}
