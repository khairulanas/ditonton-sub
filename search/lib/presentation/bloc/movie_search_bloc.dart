part of 'search_bloc.dart';

class MovieSearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchMovies _searchMovies;
  MovieSearchBloc(this._searchMovies) : super(SearchEmpty()) {
    on<OnQueryChanged>((event, emit) async {
      final query = event.query;
      emit(SearchLoading());
      final result = await _searchMovies.execute(query);
      result.fold(
        (failure) => emit(SearchError(failure.message)),
        (data) => emit(SearchHasData<Movie>(data)),
      );
    }, transformer: debounce(const Duration(milliseconds: 500)));
  }
}
