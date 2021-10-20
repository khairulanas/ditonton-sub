import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/tv.dart';
import 'package:core/domain/usecases/get_watchlist_tvs.dart';
import 'package:equatable/equatable.dart';

part 'watchlist_tvs_event.dart';
part 'watchlist_tvs_state.dart';

class WatchlistTvsBloc extends Bloc<FetchWatchlistTvsEvent, WatchlistTvsState> {
  final GetWatchlistTvs getWatchlistTvs;
  WatchlistTvsBloc(this.getWatchlistTvs) : super(WatchlistTvsEmpty()) {
    on<FetchWatchlistTvsEvent>((event, emit) async {
      emit(WatchlistTvsLoading());
      final result = await getWatchlistTvs.execute();
      result.fold(
        (failure) => emit(WatchlistTvsError(failure.message)),
        (moviesData) => emit(WatchlistTvsLoaded(moviesData)),
      );
    });
  }
}
