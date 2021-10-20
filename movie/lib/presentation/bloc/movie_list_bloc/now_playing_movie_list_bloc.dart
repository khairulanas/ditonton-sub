part of 'movie_list_bloc.dart';

class NowPlayingMovieListBloc
    extends Bloc<FetchMovieListEvent, MovieListState> {
  final GetNowPlayingMovies getNowPlayingMovies;
  NowPlayingMovieListBloc(this.getNowPlayingMovies) : super(MovieListEmpty()) {
    on<FetchMovieListEvent>((event, emit) async {
      emit(MovieListLoading());

      final result = await getNowPlayingMovies.execute();
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
