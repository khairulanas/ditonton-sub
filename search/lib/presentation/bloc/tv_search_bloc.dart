part of 'search_bloc.dart';

class TvSearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchTvs _searchTvs;
  TvSearchBloc(this._searchTvs) : super(SearchEmpty()) {
    on<OnQueryChanged>((event, emit) async {
      final query = event.query;
      emit(SearchLoading());
      final result = await _searchTvs.execute(query);
      result.fold(
        (failure) => emit(SearchError(failure.message)),
        (data) => emit(SearchHasData<Tv>(data)),
      );
    }, transformer: debounce(const Duration(milliseconds: 500)));
  }
}
