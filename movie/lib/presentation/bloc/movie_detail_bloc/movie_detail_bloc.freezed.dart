// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'movie_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MovieDetailEventTearOff {
  const _$MovieDetailEventTearOff();

  FetchMovieDetail fetchMovieDetail(int id) {
    return FetchMovieDetail(
      id,
    );
  }

  AddWatchlist addWatchlist(MovieDetail movie) {
    return AddWatchlist(
      movie,
    );
  }

  RemoveFromWatchlist removeFromWatchlist(MovieDetail movie) {
    return RemoveFromWatchlist(
      movie,
    );
  }

  LoadWatchlistStatus loadWatchlistStatus(int id) {
    return LoadWatchlistStatus(
      id,
    );
  }
}

/// @nodoc
const $MovieDetailEvent = _$MovieDetailEventTearOff();

/// @nodoc
mixin _$MovieDetailEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) fetchMovieDetail,
    required TResult Function(MovieDetail movie) addWatchlist,
    required TResult Function(MovieDetail movie) removeFromWatchlist,
    required TResult Function(int id) loadWatchlistStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int id)? fetchMovieDetail,
    TResult Function(MovieDetail movie)? addWatchlist,
    TResult Function(MovieDetail movie)? removeFromWatchlist,
    TResult Function(int id)? loadWatchlistStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? fetchMovieDetail,
    TResult Function(MovieDetail movie)? addWatchlist,
    TResult Function(MovieDetail movie)? removeFromWatchlist,
    TResult Function(int id)? loadWatchlistStatus,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchMovieDetail value) fetchMovieDetail,
    required TResult Function(AddWatchlist value) addWatchlist,
    required TResult Function(RemoveFromWatchlist value) removeFromWatchlist,
    required TResult Function(LoadWatchlistStatus value) loadWatchlistStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FetchMovieDetail value)? fetchMovieDetail,
    TResult Function(AddWatchlist value)? addWatchlist,
    TResult Function(RemoveFromWatchlist value)? removeFromWatchlist,
    TResult Function(LoadWatchlistStatus value)? loadWatchlistStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchMovieDetail value)? fetchMovieDetail,
    TResult Function(AddWatchlist value)? addWatchlist,
    TResult Function(RemoveFromWatchlist value)? removeFromWatchlist,
    TResult Function(LoadWatchlistStatus value)? loadWatchlistStatus,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieDetailEventCopyWith<$Res> {
  factory $MovieDetailEventCopyWith(
          MovieDetailEvent value, $Res Function(MovieDetailEvent) then) =
      _$MovieDetailEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$MovieDetailEventCopyWithImpl<$Res>
    implements $MovieDetailEventCopyWith<$Res> {
  _$MovieDetailEventCopyWithImpl(this._value, this._then);

  final MovieDetailEvent _value;
  // ignore: unused_field
  final $Res Function(MovieDetailEvent) _then;
}

/// @nodoc
abstract class $FetchMovieDetailCopyWith<$Res> {
  factory $FetchMovieDetailCopyWith(
          FetchMovieDetail value, $Res Function(FetchMovieDetail) then) =
      _$FetchMovieDetailCopyWithImpl<$Res>;
  $Res call({int id});
}

/// @nodoc
class _$FetchMovieDetailCopyWithImpl<$Res>
    extends _$MovieDetailEventCopyWithImpl<$Res>
    implements $FetchMovieDetailCopyWith<$Res> {
  _$FetchMovieDetailCopyWithImpl(
      FetchMovieDetail _value, $Res Function(FetchMovieDetail) _then)
      : super(_value, (v) => _then(v as FetchMovieDetail));

  @override
  FetchMovieDetail get _value => super._value as FetchMovieDetail;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(FetchMovieDetail(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$FetchMovieDetail implements FetchMovieDetail {
  const _$FetchMovieDetail(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'MovieDetailEvent.fetchMovieDetail(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FetchMovieDetail &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  $FetchMovieDetailCopyWith<FetchMovieDetail> get copyWith =>
      _$FetchMovieDetailCopyWithImpl<FetchMovieDetail>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) fetchMovieDetail,
    required TResult Function(MovieDetail movie) addWatchlist,
    required TResult Function(MovieDetail movie) removeFromWatchlist,
    required TResult Function(int id) loadWatchlistStatus,
  }) {
    return fetchMovieDetail(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int id)? fetchMovieDetail,
    TResult Function(MovieDetail movie)? addWatchlist,
    TResult Function(MovieDetail movie)? removeFromWatchlist,
    TResult Function(int id)? loadWatchlistStatus,
  }) {
    return fetchMovieDetail?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? fetchMovieDetail,
    TResult Function(MovieDetail movie)? addWatchlist,
    TResult Function(MovieDetail movie)? removeFromWatchlist,
    TResult Function(int id)? loadWatchlistStatus,
    required TResult orElse(),
  }) {
    if (fetchMovieDetail != null) {
      return fetchMovieDetail(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchMovieDetail value) fetchMovieDetail,
    required TResult Function(AddWatchlist value) addWatchlist,
    required TResult Function(RemoveFromWatchlist value) removeFromWatchlist,
    required TResult Function(LoadWatchlistStatus value) loadWatchlistStatus,
  }) {
    return fetchMovieDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FetchMovieDetail value)? fetchMovieDetail,
    TResult Function(AddWatchlist value)? addWatchlist,
    TResult Function(RemoveFromWatchlist value)? removeFromWatchlist,
    TResult Function(LoadWatchlistStatus value)? loadWatchlistStatus,
  }) {
    return fetchMovieDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchMovieDetail value)? fetchMovieDetail,
    TResult Function(AddWatchlist value)? addWatchlist,
    TResult Function(RemoveFromWatchlist value)? removeFromWatchlist,
    TResult Function(LoadWatchlistStatus value)? loadWatchlistStatus,
    required TResult orElse(),
  }) {
    if (fetchMovieDetail != null) {
      return fetchMovieDetail(this);
    }
    return orElse();
  }
}

abstract class FetchMovieDetail implements MovieDetailEvent {
  const factory FetchMovieDetail(int id) = _$FetchMovieDetail;

  int get id;
  @JsonKey(ignore: true)
  $FetchMovieDetailCopyWith<FetchMovieDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddWatchlistCopyWith<$Res> {
  factory $AddWatchlistCopyWith(
          AddWatchlist value, $Res Function(AddWatchlist) then) =
      _$AddWatchlistCopyWithImpl<$Res>;
  $Res call({MovieDetail movie});
}

/// @nodoc
class _$AddWatchlistCopyWithImpl<$Res>
    extends _$MovieDetailEventCopyWithImpl<$Res>
    implements $AddWatchlistCopyWith<$Res> {
  _$AddWatchlistCopyWithImpl(
      AddWatchlist _value, $Res Function(AddWatchlist) _then)
      : super(_value, (v) => _then(v as AddWatchlist));

  @override
  AddWatchlist get _value => super._value as AddWatchlist;

  @override
  $Res call({
    Object? movie = freezed,
  }) {
    return _then(AddWatchlist(
      movie == freezed
          ? _value.movie
          : movie // ignore: cast_nullable_to_non_nullable
              as MovieDetail,
    ));
  }
}

/// @nodoc

class _$AddWatchlist implements AddWatchlist {
  const _$AddWatchlist(this.movie);

  @override
  final MovieDetail movie;

  @override
  String toString() {
    return 'MovieDetailEvent.addWatchlist(movie: $movie)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddWatchlist &&
            (identical(other.movie, movie) || other.movie == movie));
  }

  @override
  int get hashCode => Object.hash(runtimeType, movie);

  @JsonKey(ignore: true)
  @override
  $AddWatchlistCopyWith<AddWatchlist> get copyWith =>
      _$AddWatchlistCopyWithImpl<AddWatchlist>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) fetchMovieDetail,
    required TResult Function(MovieDetail movie) addWatchlist,
    required TResult Function(MovieDetail movie) removeFromWatchlist,
    required TResult Function(int id) loadWatchlistStatus,
  }) {
    return addWatchlist(movie);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int id)? fetchMovieDetail,
    TResult Function(MovieDetail movie)? addWatchlist,
    TResult Function(MovieDetail movie)? removeFromWatchlist,
    TResult Function(int id)? loadWatchlistStatus,
  }) {
    return addWatchlist?.call(movie);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? fetchMovieDetail,
    TResult Function(MovieDetail movie)? addWatchlist,
    TResult Function(MovieDetail movie)? removeFromWatchlist,
    TResult Function(int id)? loadWatchlistStatus,
    required TResult orElse(),
  }) {
    if (addWatchlist != null) {
      return addWatchlist(movie);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchMovieDetail value) fetchMovieDetail,
    required TResult Function(AddWatchlist value) addWatchlist,
    required TResult Function(RemoveFromWatchlist value) removeFromWatchlist,
    required TResult Function(LoadWatchlistStatus value) loadWatchlistStatus,
  }) {
    return addWatchlist(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FetchMovieDetail value)? fetchMovieDetail,
    TResult Function(AddWatchlist value)? addWatchlist,
    TResult Function(RemoveFromWatchlist value)? removeFromWatchlist,
    TResult Function(LoadWatchlistStatus value)? loadWatchlistStatus,
  }) {
    return addWatchlist?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchMovieDetail value)? fetchMovieDetail,
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

abstract class AddWatchlist implements MovieDetailEvent {
  const factory AddWatchlist(MovieDetail movie) = _$AddWatchlist;

  MovieDetail get movie;
  @JsonKey(ignore: true)
  $AddWatchlistCopyWith<AddWatchlist> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemoveFromWatchlistCopyWith<$Res> {
  factory $RemoveFromWatchlistCopyWith(
          RemoveFromWatchlist value, $Res Function(RemoveFromWatchlist) then) =
      _$RemoveFromWatchlistCopyWithImpl<$Res>;
  $Res call({MovieDetail movie});
}

/// @nodoc
class _$RemoveFromWatchlistCopyWithImpl<$Res>
    extends _$MovieDetailEventCopyWithImpl<$Res>
    implements $RemoveFromWatchlistCopyWith<$Res> {
  _$RemoveFromWatchlistCopyWithImpl(
      RemoveFromWatchlist _value, $Res Function(RemoveFromWatchlist) _then)
      : super(_value, (v) => _then(v as RemoveFromWatchlist));

  @override
  RemoveFromWatchlist get _value => super._value as RemoveFromWatchlist;

  @override
  $Res call({
    Object? movie = freezed,
  }) {
    return _then(RemoveFromWatchlist(
      movie == freezed
          ? _value.movie
          : movie // ignore: cast_nullable_to_non_nullable
              as MovieDetail,
    ));
  }
}

/// @nodoc

class _$RemoveFromWatchlist implements RemoveFromWatchlist {
  const _$RemoveFromWatchlist(this.movie);

  @override
  final MovieDetail movie;

  @override
  String toString() {
    return 'MovieDetailEvent.removeFromWatchlist(movie: $movie)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RemoveFromWatchlist &&
            (identical(other.movie, movie) || other.movie == movie));
  }

  @override
  int get hashCode => Object.hash(runtimeType, movie);

  @JsonKey(ignore: true)
  @override
  $RemoveFromWatchlistCopyWith<RemoveFromWatchlist> get copyWith =>
      _$RemoveFromWatchlistCopyWithImpl<RemoveFromWatchlist>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) fetchMovieDetail,
    required TResult Function(MovieDetail movie) addWatchlist,
    required TResult Function(MovieDetail movie) removeFromWatchlist,
    required TResult Function(int id) loadWatchlistStatus,
  }) {
    return removeFromWatchlist(movie);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int id)? fetchMovieDetail,
    TResult Function(MovieDetail movie)? addWatchlist,
    TResult Function(MovieDetail movie)? removeFromWatchlist,
    TResult Function(int id)? loadWatchlistStatus,
  }) {
    return removeFromWatchlist?.call(movie);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? fetchMovieDetail,
    TResult Function(MovieDetail movie)? addWatchlist,
    TResult Function(MovieDetail movie)? removeFromWatchlist,
    TResult Function(int id)? loadWatchlistStatus,
    required TResult orElse(),
  }) {
    if (removeFromWatchlist != null) {
      return removeFromWatchlist(movie);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchMovieDetail value) fetchMovieDetail,
    required TResult Function(AddWatchlist value) addWatchlist,
    required TResult Function(RemoveFromWatchlist value) removeFromWatchlist,
    required TResult Function(LoadWatchlistStatus value) loadWatchlistStatus,
  }) {
    return removeFromWatchlist(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FetchMovieDetail value)? fetchMovieDetail,
    TResult Function(AddWatchlist value)? addWatchlist,
    TResult Function(RemoveFromWatchlist value)? removeFromWatchlist,
    TResult Function(LoadWatchlistStatus value)? loadWatchlistStatus,
  }) {
    return removeFromWatchlist?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchMovieDetail value)? fetchMovieDetail,
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

abstract class RemoveFromWatchlist implements MovieDetailEvent {
  const factory RemoveFromWatchlist(MovieDetail movie) = _$RemoveFromWatchlist;

  MovieDetail get movie;
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
    extends _$MovieDetailEventCopyWithImpl<$Res>
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
    return 'MovieDetailEvent.loadWatchlistStatus(id: $id)';
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
    required TResult Function(int id) fetchMovieDetail,
    required TResult Function(MovieDetail movie) addWatchlist,
    required TResult Function(MovieDetail movie) removeFromWatchlist,
    required TResult Function(int id) loadWatchlistStatus,
  }) {
    return loadWatchlistStatus(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int id)? fetchMovieDetail,
    TResult Function(MovieDetail movie)? addWatchlist,
    TResult Function(MovieDetail movie)? removeFromWatchlist,
    TResult Function(int id)? loadWatchlistStatus,
  }) {
    return loadWatchlistStatus?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? fetchMovieDetail,
    TResult Function(MovieDetail movie)? addWatchlist,
    TResult Function(MovieDetail movie)? removeFromWatchlist,
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
    required TResult Function(FetchMovieDetail value) fetchMovieDetail,
    required TResult Function(AddWatchlist value) addWatchlist,
    required TResult Function(RemoveFromWatchlist value) removeFromWatchlist,
    required TResult Function(LoadWatchlistStatus value) loadWatchlistStatus,
  }) {
    return loadWatchlistStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FetchMovieDetail value)? fetchMovieDetail,
    TResult Function(AddWatchlist value)? addWatchlist,
    TResult Function(RemoveFromWatchlist value)? removeFromWatchlist,
    TResult Function(LoadWatchlistStatus value)? loadWatchlistStatus,
  }) {
    return loadWatchlistStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchMovieDetail value)? fetchMovieDetail,
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

abstract class LoadWatchlistStatus implements MovieDetailEvent {
  const factory LoadWatchlistStatus(int id) = _$LoadWatchlistStatus;

  int get id;
  @JsonKey(ignore: true)
  $LoadWatchlistStatusCopyWith<LoadWatchlistStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$MovieDetailStateTearOff {
  const _$MovieDetailStateTearOff();

  _MovieDetailState call(
      {required MovieDetail? movie,
      required RequestState movieState,
      required List<Movie> movieRecommendations,
      required RequestState recommendationState,
      required String message,
      required String watchlistMessage,
      required bool isAddedToWatchlist}) {
    return _MovieDetailState(
      movie: movie,
      movieState: movieState,
      movieRecommendations: movieRecommendations,
      recommendationState: recommendationState,
      message: message,
      watchlistMessage: watchlistMessage,
      isAddedToWatchlist: isAddedToWatchlist,
    );
  }
}

/// @nodoc
const $MovieDetailState = _$MovieDetailStateTearOff();

/// @nodoc
mixin _$MovieDetailState {
  MovieDetail? get movie => throw _privateConstructorUsedError;
  RequestState get movieState => throw _privateConstructorUsedError;
  List<Movie> get movieRecommendations => throw _privateConstructorUsedError;
  RequestState get recommendationState => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get watchlistMessage => throw _privateConstructorUsedError;
  bool get isAddedToWatchlist => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MovieDetailStateCopyWith<MovieDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieDetailStateCopyWith<$Res> {
  factory $MovieDetailStateCopyWith(
          MovieDetailState value, $Res Function(MovieDetailState) then) =
      _$MovieDetailStateCopyWithImpl<$Res>;
  $Res call(
      {MovieDetail? movie,
      RequestState movieState,
      List<Movie> movieRecommendations,
      RequestState recommendationState,
      String message,
      String watchlistMessage,
      bool isAddedToWatchlist});
}

/// @nodoc
class _$MovieDetailStateCopyWithImpl<$Res>
    implements $MovieDetailStateCopyWith<$Res> {
  _$MovieDetailStateCopyWithImpl(this._value, this._then);

  final MovieDetailState _value;
  // ignore: unused_field
  final $Res Function(MovieDetailState) _then;

  @override
  $Res call({
    Object? movie = freezed,
    Object? movieState = freezed,
    Object? movieRecommendations = freezed,
    Object? recommendationState = freezed,
    Object? message = freezed,
    Object? watchlistMessage = freezed,
    Object? isAddedToWatchlist = freezed,
  }) {
    return _then(_value.copyWith(
      movie: movie == freezed
          ? _value.movie
          : movie // ignore: cast_nullable_to_non_nullable
              as MovieDetail?,
      movieState: movieState == freezed
          ? _value.movieState
          : movieState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      movieRecommendations: movieRecommendations == freezed
          ? _value.movieRecommendations
          : movieRecommendations // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
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
abstract class _$MovieDetailStateCopyWith<$Res>
    implements $MovieDetailStateCopyWith<$Res> {
  factory _$MovieDetailStateCopyWith(
          _MovieDetailState value, $Res Function(_MovieDetailState) then) =
      __$MovieDetailStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {MovieDetail? movie,
      RequestState movieState,
      List<Movie> movieRecommendations,
      RequestState recommendationState,
      String message,
      String watchlistMessage,
      bool isAddedToWatchlist});
}

/// @nodoc
class __$MovieDetailStateCopyWithImpl<$Res>
    extends _$MovieDetailStateCopyWithImpl<$Res>
    implements _$MovieDetailStateCopyWith<$Res> {
  __$MovieDetailStateCopyWithImpl(
      _MovieDetailState _value, $Res Function(_MovieDetailState) _then)
      : super(_value, (v) => _then(v as _MovieDetailState));

  @override
  _MovieDetailState get _value => super._value as _MovieDetailState;

  @override
  $Res call({
    Object? movie = freezed,
    Object? movieState = freezed,
    Object? movieRecommendations = freezed,
    Object? recommendationState = freezed,
    Object? message = freezed,
    Object? watchlistMessage = freezed,
    Object? isAddedToWatchlist = freezed,
  }) {
    return _then(_MovieDetailState(
      movie: movie == freezed
          ? _value.movie
          : movie // ignore: cast_nullable_to_non_nullable
              as MovieDetail?,
      movieState: movieState == freezed
          ? _value.movieState
          : movieState // ignore: cast_nullable_to_non_nullable
              as RequestState,
      movieRecommendations: movieRecommendations == freezed
          ? _value.movieRecommendations
          : movieRecommendations // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
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

class _$_MovieDetailState implements _MovieDetailState {
  const _$_MovieDetailState(
      {required this.movie,
      required this.movieState,
      required this.movieRecommendations,
      required this.recommendationState,
      required this.message,
      required this.watchlistMessage,
      required this.isAddedToWatchlist});

  @override
  final MovieDetail? movie;
  @override
  final RequestState movieState;
  @override
  final List<Movie> movieRecommendations;
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
    return 'MovieDetailState(movie: $movie, movieState: $movieState, movieRecommendations: $movieRecommendations, recommendationState: $recommendationState, message: $message, watchlistMessage: $watchlistMessage, isAddedToWatchlist: $isAddedToWatchlist)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MovieDetailState &&
            (identical(other.movie, movie) || other.movie == movie) &&
            (identical(other.movieState, movieState) ||
                other.movieState == movieState) &&
            const DeepCollectionEquality()
                .equals(other.movieRecommendations, movieRecommendations) &&
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
      movie,
      movieState,
      const DeepCollectionEquality().hash(movieRecommendations),
      recommendationState,
      message,
      watchlistMessage,
      isAddedToWatchlist);

  @JsonKey(ignore: true)
  @override
  _$MovieDetailStateCopyWith<_MovieDetailState> get copyWith =>
      __$MovieDetailStateCopyWithImpl<_MovieDetailState>(this, _$identity);
}

abstract class _MovieDetailState implements MovieDetailState {
  const factory _MovieDetailState(
      {required MovieDetail? movie,
      required RequestState movieState,
      required List<Movie> movieRecommendations,
      required RequestState recommendationState,
      required String message,
      required String watchlistMessage,
      required bool isAddedToWatchlist}) = _$_MovieDetailState;

  @override
  MovieDetail? get movie;
  @override
  RequestState get movieState;
  @override
  List<Movie> get movieRecommendations;
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
  _$MovieDetailStateCopyWith<_MovieDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}
