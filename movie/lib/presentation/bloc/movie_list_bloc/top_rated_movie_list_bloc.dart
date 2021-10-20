part of 'movie_list_bloc.dart';

class TopRatedMovieListBloc extends Bloc<FetchMovieListEvent, MovieListState> {
  final GetTopRatedMovies getTopRatedMovies;
  TopRatedMovieListBloc(this.getTopRatedMovies) : super(MovieListEmpty()) {
    on<FetchMovieListEvent>((event, emit) async {
      emit(MovieListLoading());

      final result = await getTopRatedMovies.execute();
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
