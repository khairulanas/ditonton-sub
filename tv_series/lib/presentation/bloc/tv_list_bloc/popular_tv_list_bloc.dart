part of 'tv_list_bloc.dart';

class PopularTvListBloc extends Bloc<FetchTvListEvent, TvListState> {
  final GetPopularTvs getPopularTvs;
  PopularTvListBloc(this.getPopularTvs) : super(TvListEmpty()) {
    on<FetchTvListEvent>((event, emit) async {
      emit(TvListLoading());

      final result = await getPopularTvs.execute();
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
