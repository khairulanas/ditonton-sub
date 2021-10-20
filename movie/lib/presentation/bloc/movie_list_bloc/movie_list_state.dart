part of 'movie_list_bloc.dart';

abstract class MovieListState extends Equatable {
  const MovieListState();

  @override
  List<Object> get props => [];
}

class MovieListEmpty extends MovieListState {}

class MovieListLoading extends MovieListState {}

class MovieListError extends MovieListState {
  final String message;

  MovieListError(this.message);
  @override
  List<Object> get props => [message];
}

class MovieListLoaded extends MovieListState {
  final List<Movie> movies;
  MovieListLoaded({
    required this.movies,
  });
  @override
  List<Object> get props => [movies];
}
