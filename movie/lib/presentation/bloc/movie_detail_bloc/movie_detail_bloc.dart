import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:core/domain/entities/movie.dart';
import 'package:core/domain/entities/movie_detail.dart';
import 'package:core/domain/usecases/get_watchlist_status.dart';
import 'package:core/domain/usecases/remove_watchlist.dart';
import 'package:core/domain/usecases/save_watchlist.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie/domain/usecases/get_movie_detail.dart';
import 'package:movie/domain/usecases/get_movie_recommendations.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';
part 'movie_detail_bloc.freezed.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  static const watchlistAddSuccessMessage = 'Added to Watchlist';
  static const watchlistRemoveSuccessMessage = 'Removed from Watchlist';

  final GetMovieDetail getMovieDetail;
  final GetMovieRecommendations getMovieRecommendations;
  final GetWatchListStatus getWatchListStatus;
  final SaveWatchlist saveWatchlist;
  final RemoveWatchlist removeWatchlist;
  MovieDetailBloc({
    required this.getMovieDetail,
    required this.getMovieRecommendations,
    required this.getWatchListStatus,
    required this.saveWatchlist,
    required this.removeWatchlist,
  }) : super(MovieDetailState.initial()) {
    on<MovieDetailEvent>((event, emit) async {
      await event.map(
        fetchMovieDetail: (v) async {
          emit(state.copyWith(movieState: RequestState.Loading));

          final detailResult = await getMovieDetail.execute(v.id);
          final recommendationResult =
              await getMovieRecommendations.execute(v.id);
          await detailResult.fold(
            (failure) async => emit(state.copyWith(
                movieState: RequestState.Error, message: failure.message)),
            (movie) async {
              emit(state.copyWith(
                  movieState: RequestState.Loaded,
                  message: '',
                  recommendationState: RequestState.Loading,
                  movie: movie));

              recommendationResult.fold(
                (failure) {
                  emit(state.copyWith(
                    message: failure.message,
                    recommendationState: RequestState.Error,
                  ));
                },
                (movies) {
                  emit(state.copyWith(
                    message: '',
                    movieRecommendations: movies,
                    recommendationState: RequestState.Loaded,
                  ));
                },
              );
            },
          );
        },
        addWatchlist: (v) async {
          final result = await saveWatchlist.execute(v.movie);
          result.fold(
            (failure) {
              emit(state.copyWith(watchlistMessage: failure.message));
            },
            (successMessage) {
              emit(state.copyWith(watchlistMessage: successMessage));
            },
          );
          add(MovieDetailEvent.loadWatchlistStatus(v.movie.id));
        },
        removeFromWatchlist: (v) async {
          final result = await removeWatchlist.execute(v.movie);

          result.fold(
            (failure) {
              emit(state.copyWith(watchlistMessage: failure.message));
            },
            (successMessage) {
              emit(state.copyWith(watchlistMessage: successMessage));
            },
          );

          add(MovieDetailEvent.loadWatchlistStatus(v.movie.id));
        },
        loadWatchlistStatus: (v) async {
          final result = await getWatchListStatus.execute(v.id);
          emit(state.copyWith(isAddedToWatchlist: result));
        },
      );
    });
  }
}
