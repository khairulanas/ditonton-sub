part of 'movie_detail_bloc.dart';

// abstract class MovieDetailState extends Equatable {}

// class MovieDetailEmpty extends MovieDetailState {
//   @override
//   List<Object?> get props => [];
// }
// class MovieDetailLoaded extends MovieDetailState {
//   @override
//   List<Object?> get props => [];
// }
// class MovieDetailError extends MovieDetailState {
//   @override
//   List<Object?> get props => [];
// }
@freezed
abstract class MovieDetailState with _$MovieDetailState {
  const factory MovieDetailState(
      {required MovieDetail? movie,
      required RequestState movieState,
      required List<Movie> movieRecommendations,
      required RequestState recommendationState,
      required String message,
      required String watchlistMessage,
      required bool isAddedToWatchlist}) = _MovieDetailState;

  factory MovieDetailState.initial() => MovieDetailState(
      movieState: RequestState.Empty,
      recommendationState: RequestState.Empty,
      message: '',
      isAddedToWatchlist: false,
      movieRecommendations: [],
      movie: null,
      watchlistMessage: '');
}
