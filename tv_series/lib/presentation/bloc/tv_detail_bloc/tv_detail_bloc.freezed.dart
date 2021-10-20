// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tv_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TvDetailEventTearOff {
  const _$TvDetailEventTearOff();

  FetchTvDetail fetchTvDetail(int id) {
    return FetchTvDetail(
      id,
    );
  }

  AddWatchlist addWatchlist(TvDetail tv) {
    return AddWatchlist(
      tv,
    );
  }

  RemoveFromWatchlist removeFromWatchlist(TvDetail tv) {
    return RemoveFromWatchlist(
      tv,
    );
  }

  LoadWatchlistStatus loadWatchlistStatus(int id) {
    return LoadWatchlistStatus(
      id,
    );
  }
}

/// @nodoc
const $TvDetailEvent = _$TvDetailEventTearOff();

/// @nodoc
mixin _$TvDetailEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) fetchTvDetail,
    required TResult Function(TvDetail tv) addWatchlist,
    required TResult Function(TvDetail tv) removeFromWatchlist,
    required TResult Function(int id) loadWatchlistStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int id)? fetchTvDetail,
    TResult Function(TvDetail tv)? addWatchlist,
    TResult Function(TvDetail tv)? removeFromWatchlist,
    TResult Function(int id)? loadWatchlistStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? fetchTvDetail,
    TResult Function(TvDetail tv)? addWatchlist,
    TResult Function(TvDetail tv)? removeFromWatchlist,
    TResult Function(int id)? loadWatchlistStatus,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchTvDetail value) fetchTvDetail,
    required TResult Function(AddWatchlist value) addWatchlist,
    required TResult Function(RemoveFromWatchlist value) removeFromWatchlist,
    required TResult Function(LoadWatchlistStatus value) loadWatchlistStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FetchTvDetail value)? fetchTvDetail,
    TResult Function(AddWatchlist value)? addWatchlist,
    TResult Function(RemoveFromWatchlist value)? removeFromWatchlist,
    TResult Function(LoadWatchlistStatus value)? loadWatchlistStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchTvDetail value)? fetchTvDetail,
    TResult Function(AddWatchlist value)? addWatchlist,
    TResult Function(RemoveFromWatchlist value)? removeFromWatchlist,
    TResult Function(LoadWatchlistStatus value)? loadWatchlistStatus,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TvDetailEventCopyWith<$Res> {
  factory $TvDetailEventCopyWith(
          TvDetailEvent value, $Res Function(TvDetailEvent) then) =
      _$TvDetailEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$TvDetailEventCopyWithImpl<$Res>
    implements $TvDetailEventCopyWith<$Res> {
  _$TvDetailEventCopyWithImpl(this._value, this._then);

  final TvDetailEvent _value;
  // ignore: unused_field
  final $Res Function(TvDetailEvent) _then;
}

/// @nodoc
abstract class $FetchTvDetailCopyWith<$Res> {
  factory $FetchTvDetailCopyWith(
          FetchTvDetail value, $Res Function(FetchTvDetail) then) =
      _$FetchTvDetailCopyWithImpl<$Res>;
  $Res call({int id});
}

/// @nodoc
class _$FetchTvDetailCopyWithImpl<$Res>
    extends _$TvDetailEventCopyWithImpl<$Res>
    implements $FetchTvDetailCopyWith<$Res> {
  _$FetchTvDetailCopyWithImpl(
      FetchTvDetail _value, $Res Function(FetchTvDetail) _then)
      : super(_value, (v) => _then(v as FetchTvDetail));

  @override
  FetchTvDetail get _value => super._value as FetchTvDetail;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(FetchTvDetail(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$FetchTvDetail implements FetchTvDetail {
  const _$FetchTvDetail(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'TvDetailEvent.fetchTvDetail(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FetchTvDetail &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  $FetchTvDetailCopyWith<FetchTvDetail> get copyWith =>
      _$FetchTvDetailCopyWithImpl<FetchTvDetail>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) fetchTvDetail,
    required TResult Function(TvDetail tv) addWatchlist,
    required TResult Function(TvDetail tv) removeFromWatchlist,
    required TResult Function(int id) loadWatchlistStatus,
  }) {
    return fetchTvDetail(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int id)? fetchTvDetail,
    TResult Function(TvDetail tv)? addWatchlist,
    TResult Function(TvDetail tv)? removeFromWatchlist,
    TResult Function(int id)? loadWatchlistStatus,
  }) {
    return fetchTvDetail?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? fetchTvDetail,
    TResult Function(TvDetail tv)? addWatchlist,
    TResult Function(TvDetail tv)? removeFromWatchlist,
    TResult Function(int id)? loadWatchlistStatus,
    required TResult orElse(),
  }) {
    if (fetchTvDetail != null) {
      return fetchTvDetail(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchTvDetail value) fetchTvDetail,
    required TResult Function(AddWatchlist value) addWatchlist,
    required TResult Function(RemoveFromWatchlist value) removeFromWatchlist,
    required TResult Function(LoadWatchlistStatus value) loadWatchlistStatus,
  }) {
    return fetchTvDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FetchTvDetail value)? fetchTvDetail,
    TResult Function(AddWatchlist value)? addWatchlist,
    TResult Function(RemoveFromWatchlist value)? removeFromWatchlist,
    TResult Function(LoadWatchlistStatus value)? loadWatchlistStatus,
  }) {
    return fetchTvDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchTvDetail value)? fetchTvDetail,
    TResult Function(AddWatchlist value)? addWatchlist,
    TResult Function(RemoveFromWatchlist value)? removeFromWatchlist,
    TResult Function(LoadWatchlistStatus value)? loadWatchlistStatus,
    required TResult orElse(),
  }) {
    if (fetchTvDetail != null) {
      return fetchTvDetail(this);
    }
    return orElse();
  }
}

abstract class FetchTvDetail implements TvDetailEvent {
  const factory FetchTvDetail(int id) = _$FetchTvDetail;

  int get id;
  @JsonKey(ignore: true)
  $FetchTvDetailCopyWith<FetchTvDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddWatchlistCopyWith<$Res> {
  factory $AddWatchlistCopyWith(
          AddWatchlist value, $Res Function(AddWatchlist) then) =
      _$AddWatchlistCopyWithImpl<$Res>;
  $Res call({TvDetail tv});
}

/// @nodoc
class _$AddWatchlistCopyWithImpl<$Res> extends _$TvDetailEventCopyWithImpl<$Res>
    implements $AddWatchlistCopyWith<$Res> {
  _$AddWatchlistCopyWithImpl(
      AddWatchlist _value, $Res Function(AddWatchlist) _then)
      : super(_value, (v) => _then(v as AddWatchlist));

  @override
  AddWatchlist get _value => super._value as AddWatchlist;

  @override
  $Res call({
    Object? tv = freezed,
  }) {
    return _then(AddWatchlist(
      tv == freezed
          ? _value.tv
          : tv // ignore: cast_nullable_to_non_nullable
              as TvDetail,
    ));
  }
}

/// @nodoc

class _$AddWatchlist implements AddWatchlist {
  const _$AddWatchlist(this.tv);

  @override
  final TvDetail tv;

  @override
  String toString() {
    return 'TvDetailEvent.addWatchlist(tv: $tv)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddWatchlist &&
            (identical(other.tv, tv) || other.tv == tv));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tv);

  @JsonKey(ignore: true)
  @override
  $AddWatchlistCopyWith<AddWatchlist> get copyWith =>
      _$AddWatchlistCopyWithImpl<AddWatchlist>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) fetchTvDetail,
    required TResult Function(TvDetail tv) addWatchlist,
    required TResult Function(TvDetail tv) removeFromWatchlist,
    required TResult Function(int id) loadWatchlistStatus,
  }) {
    return addWatchlist(tv);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int id)? fetchTvDetail,
    TResult Function(TvDetail tv)? addWatchlist,
    TResult Function(TvDetail tv)? removeFromWatchlist,
    TResult Function(int id)? loadWatchlistStatus,
  }) {
    return addWatchlist?.call(tv);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? fetchTvDetail,
    TResult Function(TvDetail tv)? addWatchlist,
    TResult Function(TvDetail tv)? removeFromWatchlist,
    TResult Function(int id)? loadWatchlistStatus,
    required TResult orElse(),
  }) {
    if (addWatchlist != null) {
      return addWatchlist(tv);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchTvDetail value) fetchTvDetail,
    required TResult Function(AddWatchlist value) addWatchlist,
    required TResult Function(RemoveFromWatchlist value) removeFromWatchlist,
    required TResult Function(LoadWatchlistStatus value) loadWatchlistStatus,
  }) {
    return addWatchlist(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FetchTvDetail value)? fetchTvDetail,
    TResult Function(AddWatchlist value)? addWatchlist,
    TResult Function(RemoveFromWatchlist value)? removeFromWatchlist,
    TResult Function(LoadWatchlistStatus value)? loadWatchlistStatus,
  }) {
    return addWatchlist?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchTvDetail value)? fetchTvDetail,
    TResult Function(AddWatchlist value)? addWatchlist,
    TResult Function(RemoveFromWatchlist value)? removeFromWatchlist,
    TResult Function(LoadWatchlistStatus value)? loadWatchlistStatus,
    required TResult orElse(),
  }) {
    if (addWatchlist != null) {
      return addWatchlist(this);
    }
    return orElse();
  }
}

abstract class AddWatchlist implements TvDetailEvent {
  const factory AddWatchlist(TvDetail tv) = _$AddWatchlist;

  TvDetail get tv;
  @JsonKey(ignore: true)
  $AddWatchlistCopyWith<AddWatchlist> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemoveFromWatchlistCopyWith<$Res> {
  factory $RemoveFromWatchlistCopyWith(
          RemoveFromWatchlist value, $Res Function(RemoveFromWatchlist) then) =
      _$RemoveFromWatchlistCopyWithImpl<$Res>;
  $Res call({TvDetail tv});
}

/// @nodoc
class _$RemoveFromWatchlistCopyWithImpl<$Res>
    extends _$TvDetailEventCopyWithImpl<$Res>
    implements $RemoveFromWatchlistCopyWith<$Res> {
  _$RemoveFromWatchlistCopyWithImpl(
      RemoveFromWatchlist _value, $Res Function(RemoveFromWatchlist) _then)
      : super(_value, (v) => _then(v as RemoveFromWatchlist));

  @override
  RemoveFromWatchlist get _value => super._value as RemoveFromWatchlist;

  @override
  $Res call({
    Object? tv = freezed,
  }) {
    return _then(RemoveFromWatchlist(
      tv == freezed
          ? _value.tv
          : tv // ignore: cast_nullable_to_non_nullable
              as TvDetail,
    ));
  }
}

/// @nodoc

class _$RemoveFromWatchlist implements RemoveFromWatchlist {
  const _$RemoveFromWatchlist(this.tv);

  @override
  final TvDetail tv;

  @override
  String toString() {
    return 'TvDetailEvent.removeFromWatchlist(tv: $tv)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RemoveFromWatchlist &&
            (identical(other.tv, tv) || other.tv == tv));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tv);

  @JsonKey(ignore: true)
  @override
  $RemoveFromWatchlistCopyWith<RemoveFromWatchlist> get copyWith =>
      _$RemoveFromWatchlistCopyWithImpl<RemoveFromWatchlist>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) fetchTvDetail,
    required TResult Function(TvDetail tv) addWatchlist,
    required TResult Function(TvDetail tv) removeFromWatchlist,
    required TResult Function(int id) loadWatchlistStatus,
  }) {
    return removeFromWatchlist(tv);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int id)? fetchTvDetail,
    TResult Function(TvDetail tv)? addWatchlist,
    TResult Function(TvDetail tv)? removeFromWatchlist,
    TResult Function(int id)? loadWatchlistStatus,
  }) {
    return removeFromWatchlist?.call(tv);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? fetchTvDetail,
    TResult Function(TvDetail tv)? addWatchlist,
    TResult Function(TvDetail tv)? removeFromWatchlist,
    TResult Function(int id)? loadWatchlistStatus,
    required TResult orElse(),
  }) {
    if (removeFromWatchlist != null) {
      return removeFromWatchlist(tv);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchTvDetail value) fetchTvDetail,
    required TResult Function(AddWatchlist value) addWatchlist,
    required TResult Function(RemoveFromWatchlist value) removeFromWatchlist,
    required TResult Function(LoadWatchlistStatus value) loadWatchlistStatus,
  }) {
    return removeFromWatchlist(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FetchTvDetail value)? fetchTvDetail,
    TResult Function(AddWatchlist value)? addWatchlist,
    TResult Function(RemoveFromWatchlist value)? removeFromWatchlist,
    TResult Function(LoadWatchlistStatus value)? loadWatchlistStatus,
  }) {
    return removeFromWatchlist?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchTvDetail value)? fetchTvDetail,
    TResult Function(AddWatchlist value)? addWatchlist,
    TResult Function(RemoveFromWatchlist value)? removeFromWatchlist,
    TResult Function(LoadWatchlistStatus value)? loadWatchlistStatus,
    required TResult orElse(),
  }) {
    if (removeFromWatchlist != null) {
      return removeFromWatchlist(this);
    }
    return orElse();
  }
}

abstract class RemoveFromWatchlist implements TvDetailEvent {
  const factory RemoveFromWatchlist(TvDetail tv) = _$RemoveFromWatchlist;

  TvDetail get tv;
  @JsonKey(ignore: true)
  $RemoveFromWatchlistCopyWith<RemoveFromWatchlist> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoadWatchlistStatusCopyWith<$Res> {
  factory $LoadWatchlistStatusCopyWith(
          LoadWatchlistStatus value, $Res Function(LoadWatchlistStatus) then) =
      _$LoadWatchlistStatusCopyWithImpl<$Res>;
  $Res call({int id});
}

/// @nodoc
class _$LoadWatchlistStatusCopyWithImpl<$Res>
    extends _$TvDetailEventCopyWithImpl<$Res>
    implements $LoadWatchlistStatusCopyWith<$Res> {
  _$LoadWatchlistStatusCopyWithImpl(
      LoadWatchlistStatus _value, $Res Function(LoadWatchlistStatus) _then)
      : super(_value, (v) => _then(v as LoadWatchlistStatus));

  @override
  LoadWatchlistStatus get _value => super._value as LoadWatchlistStatus;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(LoadWatchlistStatus(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LoadWatchlistStatus implements LoadWatchlistStatus {
  const _$LoadWatchlistStatus(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'TvDetailEvent.loadWatchlistStatus(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadWatchlistStatus &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  $LoadWatchlistStatusCopyWith<LoadWatchlistStatus> get copyWith =>
      _$LoadWatchlistStatusCopyWithImpl<LoadWatchlistStatus>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) fetchTvDetail,
    required TResult Function(TvDetail tv) addWatchlist,
    required TResult Function(TvDetail tv) removeFromWatchlist,
    required TResult Function(int id) loadWatchlistStatus,
  }) {
    return loadWatchlistStatus(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int id)? fetchTvDetail,
    TResult Function(TvDetail tv)? addWatchlist,
    TResult Function(TvDetail tv)? removeFromWatchlist,
    TResult Function(int id)? loadWatchlistStatus,
  }) {
    return loadWatchlistStatus?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? fetchTvDetail,
    TResult Function(TvDetail tv)? addWatchlist,
    TResult Function(TvDetail tv)? removeFromWatchlist,
    TResult Function(int id)? loadWatchlistStatus,
    required TResult orElse(),
  }) {
    if (loadWatchlistStatus != null) {
      return loadWatchlistStatus(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchTvDetail value) fetchTvDetail,
    required TResult Function(AddWatchlist value) addWatchlist,
    required TResult Function(RemoveFromWatchlist value) removeFromWatchlist,
    required TResult Function(LoadWatchlistStatus value) loadWatchlistStatus,
  }) {
    return loadWatchlistStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FetchTvDetail value)? fetchTvDetail,
    TResult Function(AddWatchlist value)? addWatchlist,
    TResult Function(RemoveFromWatchlist value)? removeFromWatchlist,
    TResult Function(LoadWatchlistStatus value)? loadWatchlistStatus,
  }) {
    return loadWatchlistStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchTvDetail value)? fetchTvDetail,
    TResult Function(AddWatchlist value)? addWatchlist,
    TResult Function(RemoveFromWatchlist value)? removeFromWatchlist,
    TResult Function(LoadWatchlistStatus value)? loadWatchlistStatus,
    required TResult orElse(),
  }) {
    if (loadWatchlistStatus != null) {
      return loadWatchlistStatus(this);
    }
    return orElse();
  }
}

abstract class LoadWatchlistStatus implements TvDetailEvent {
  const factory LoadWatchlistStatus(int id) = _$LoadWatchlistStatus;

  int get id;
  @JsonKey(ignore: true)
  $LoadWatchlistStatusCopyWith<LoadWatchlistStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$TvDetailStateTearOff {
  const _$TvDetailStateTearOff();

  _TvDetailState call(
      {required TvDetail? tv,
      required RequestState tvState,
      required List<Tv> tvRecommendations,
      required RequestState recommendationState,
      required String message,
      required String watchlistMessage,
      required bool isAddedToWatchlist}) {
    return _TvDetailState(
      tv: tv,
      tvState: tvState,
      tvRecommendations: tvRecommendations,
      recommendationState: recommendationState,
      message: message,
      watchlistMessage: watchlistMessage,
      isAddedToWatchlist: isAddedToWatchlist,
    );
  }
}

/// @nodoc
const $TvDetailState = _$TvDetailStateTearOff();

/// @nodoc
mixin _$TvDetailState {
  TvDetail? get tv => throw _privateConstructorUsedError;
  RequestState get tvState => throw _privateConstructorUsedError;
  List<Tv> get tvRecommendations => throw _privateConstructorUsedError;
  RequestState get recommendationState => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get watchlistMessage => throw _privateConstructorUsedError;
  bool get isAddedToWatchlist => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TvDetailStateCopyWith<TvDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TvDetailStateCopyWith<$Res> {
  factory $TvDetailStateCopyWith(
          TvDetailState value, $Res Function(TvDetailState) then) =
      _$TvDetailStateCopyWithImpl<$Res>;
  $Res call(
      {TvDetail? tv,
      RequestState tvState,
      List<Tv> tvRecommendations,
      RequestState recommendationState,
      String message,
      String watchlistMessage,
      bool isAddedToWatchlist});
}

/// @nodoc
class _$TvDetailStateCopyWithImpl<$Res>
    implements $TvDetailStateCopyWith<$Res> {
  _$TvDetailStateCopyWithImpl(this._value, this._then);

  final TvDetailState _value;
  // ignore: unused_field
  final $Res Function(TvDetailState) _then;

  @override
  $Res call({
    Object? tv = freezed,
    Object? tvState = freezed,
    Object? tvRecommendations = freezed,
    Object? recommendationState = freezed,
    Object? message = freezed,
    Object? watchlistMessage = freezed,
    Object? isAddedToWatchlist = freezed,
  }) {
    return _then(_value.copyWith(
      tv: tv == freezed
          ? _value.tv
          : tv // ignore: cast_nullable_to_non_nullable
              as TvDetail?,
      tvState: tvState == freezed
          ? _value.tvState
          : tvState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      tvRecommendations: tvRecommendations == freezed
          ? _value.tvRecommendations
          : tvRecommendations // ignore: cast_nullable_to_non_nullable
              as List<Tv>,
      recommendationState: recommendationState == freezed
          ? _value.recommendationState
          : recommendationState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      watchlistMessage: watchlistMessage == freezed
          ? _value.watchlistMessage
          : watchlistMessage // ignore: cast_nullable_to_non_nullable
              as String,
      isAddedToWatchlist: isAddedToWatchlist == freezed
          ? _value.isAddedToWatchlist
          : isAddedToWatchlist // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$TvDetailStateCopyWith<$Res>
    implements $TvDetailStateCopyWith<$Res> {
  factory _$TvDetailStateCopyWith(
          _TvDetailState value, $Res Function(_TvDetailState) then) =
      __$TvDetailStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {TvDetail? tv,
      RequestState tvState,
      List<Tv> tvRecommendations,
      RequestState recommendationState,
      String message,
      String watchlistMessage,
      bool isAddedToWatchlist});
}

/// @nodoc
class __$TvDetailStateCopyWithImpl<$Res>
    extends _$TvDetailStateCopyWithImpl<$Res>
    implements _$TvDetailStateCopyWith<$Res> {
  __$TvDetailStateCopyWithImpl(
      _TvDetailState _value, $Res Function(_TvDetailState) _then)
      : super(_value, (v) => _then(v as _TvDetailState));

  @override
  _TvDetailState get _value => super._value as _TvDetailState;

  @override
  $Res call({
    Object? tv = freezed,
    Object? tvState = freezed,
    Object? tvRecommendations = freezed,
    Object? recommendationState = freezed,
    Object? message = freezed,
    Object? watchlistMessage = freezed,
    Object? isAddedToWatchlist = freezed,
  }) {
    return _then(_TvDetailState(
      tv: tv == freezed
          ? _value.tv
          : tv // ignore: cast_nullable_to_non_nullable
              as TvDetail?,
      tvState: tvState == freezed
          ? _value.tvState
          : tvState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      tvRecommendations: tvRecommendations == freezed
          ? _value.tvRecommendations
          : tvRecommendations // ignore: cast_nullable_to_non_nullable
              as List<Tv>,
      recommendationState: recommendationState == freezed
          ? _value.recommendationState
          : recommendationState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      watchlistMessage: watchlistMessage == freezed
          ? _value.watchlistMessage
          : watchlistMessage // ignore: cast_nullable_to_non_nullable
              as String,
      isAddedToWatchlist: isAddedToWatchlist == freezed
          ? _value.isAddedToWatchlist
          : isAddedToWatchlist // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_TvDetailState implements _TvDetailState {
  const _$_TvDetailState(
      {required this.tv,
      required this.tvState,
      required this.tvRecommendations,
      required this.recommendationState,
      required this.message,
      required this.watchlistMessage,
      required this.isAddedToWatchlist});

  @override
  final TvDetail? tv;
  @override
  final RequestState tvState;
  @override
  final List<Tv> tvRecommendations;
  @override
  final RequestState recommendationState;
  @override
  final String message;
  @override
  final String watchlistMessage;
  @override
  final bool isAddedToWatchlist;

  @override
  String toString() {
    return 'TvDetailState(tv: $tv, tvState: $tvState, tvRecommendations: $tvRecommendations, recommendationState: $recommendationState, message: $message, watchlistMessage: $watchlistMessage, isAddedToWatchlist: $isAddedToWatchlist)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TvDetailState &&
            (identical(other.tv, tv) || other.tv == tv) &&
            (identical(other.tvState, tvState) || other.tvState == tvState) &&
            const DeepCollectionEquality()
                .equals(other.tvRecommendations, tvRecommendations) &&
            (identical(other.recommendationState, recommendationState) ||
                other.recommendationState == recommendationState) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.watchlistMessage, watchlistMessage) ||
                other.watchlistMessage == watchlistMessage) &&
            (identical(other.isAddedToWatchlist, isAddedToWatchlist) ||
                other.isAddedToWatchlist == isAddedToWatchlist));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      tv,
      tvState,
      const DeepCollectionEquality().hash(tvRecommendations),
      recommendationState,
      message,
      watchlistMessage,
      isAddedToWatchlist);

  @JsonKey(ignore: true)
  @override
  _$TvDetailStateCopyWith<_TvDetailState> get copyWith =>
      __$TvDetailStateCopyWithImpl<_TvDetailState>(this, _$identity);
}

abstract class _TvDetailState implements TvDetailState {
  const factory _TvDetailState(
      {required TvDetail? tv,
      required RequestState tvState,
      required List<Tv> tvRecommendations,
      required RequestState recommendationState,
      required String message,
      required String watchlistMessage,
      required bool isAddedToWatchlist}) = _$_TvDetailState;

  @override
  TvDetail? get tv;
  @override
  RequestState get tvState;
  @override
  List<Tv> get tvRecommendations;
  @override
  RequestState get recommendationState;
  @override
  String get message;
  @override
  String get watchlistMessage;
  @override
  bool get isAddedToWatchlist;
  @override
  @JsonKey(ignore: true)
  _$TvDetailStateCopyWith<_TvDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}
