part of 'tv_list_bloc.dart';

class AiringTodayTvListBloc extends Bloc<FetchTvListEvent, TvListState> {
  final GetAiringTodayTvs getAiringTodayTvs;
  AiringTodayTvListBloc(this.getAiringTodayTvs) : super(TvListEmpty()) {
    on<FetchTvListEvent>((event, emit) async {
      emit(TvListLoading());

      final result = await getAiringTodayTvs.execute();
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
