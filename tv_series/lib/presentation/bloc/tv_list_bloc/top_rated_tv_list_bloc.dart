part of 'tv_list_bloc.dart';

class TopRatedTvListBloc extends Bloc<FetchTvListEvent, TvListState> {
  final GetTopRatedTvs getTopRatedTvs;
  TopRatedTvListBloc(this.getTopRatedTvs) : super(TvListEmpty()) {
    on<FetchTvListEvent>((event, emit) async {
      emit(TvListLoading());

      final result = await getTopRatedTvs.execute();
      result.fold(
        (failure) {
          emit(TvListError(failure.message));
        },
        (tvsData) {
          emit(TvListLoaded(tvs: tvsData));
        },
      );
    });
  }
}
