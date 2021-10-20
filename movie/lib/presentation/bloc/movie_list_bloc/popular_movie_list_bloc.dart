part of 'movie_list_bloc.dart';

class PopularMovieListBloc extends Bloc<FetchMovieListEvent, MovieListState> {
  final GetPopularMovies getPopularMovies;
  PopularMovieListBloc(this.getPopularMovies) : super(MovieListEmpty()) {
    on<FetchMovieListEvent>((event, emit) async {
      emit(MovieListLoading());

      final result = await getPopularMovies.execute();
      result.fold(
        (failure) {
          emit(MovieListError(failure.message));
        },
        (moviesData) {
          emit(MovieListLoaded(movies: moviesData));
        },
      );
    });
  }
}
