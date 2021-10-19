part of 'movie_detail_bloc.dart';

// abstract class MovieDetailEvent extends Equatable {}

// class FetchMovieDetail extends MovieDetailEvent {
//   final int id;
//   FetchMovieDetail({
//     required this.id,
//   });
//   @override
//   List<Object?> get props => [id];
// }

// class AddWatchlist extends MovieDetailEvent {
//   final MovieDetail movie;
//   AddWatchlist({
//     required this.movie,
//   });
//   @override
//   List<Object?> get props => [movie];
// }

// class RemoveFromWatchlist extends MovieDetailEvent {
//   final MovieDetail movie;
//   RemoveFromWatchlist({
//     required this.movie,
//   });
//   @override
//   List<Object?> get props => [movie];
// }

// class LoadWatchlistStatus extends MovieDetailEvent {
//   final int id;
//   LoadWatchlistStatus({
//     required this.id,
//   });
//   @override
//   List<Object?> get props => [id];
// }

@freezed
abstract class MovieDetailEvent with _$MovieDetailEvent {
  const factory MovieDetailEvent.fetchMovieDetail(int id) = FetchMovieDetail;
  const factory MovieDetailEvent.addWatchlist(MovieDetail movie) = AddWatchlist;
  const factory MovieDetailEvent.removeFromWatchlist(MovieDetail movie) =
      RemoveFromWatchlist;
  const factory MovieDetailEvent.loadWatchlistStatus(int id) =
      LoadWatchlistStatus;
}
