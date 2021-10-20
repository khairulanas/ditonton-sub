import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/tv_episode.dart';
import 'package:equatable/equatable.dart';
import 'package:tv_series/domain/usecases/get_tv_season_episodes.dart';

part 'tv_season_episode_event.dart';
part 'tv_season_episode_state.dart';

class TvSeasonEpisodeBloc
    extends Bloc<FetchTvSeasonEpisodeEvent, TvSeasonEpisodeState> {
  final GetTvSeasonEpisodes getTvSeasonEpisodes;
  TvSeasonEpisodeBloc(this.getTvSeasonEpisodes)
      : super(TvSeasonEpisodeEmpty()) {
    on<FetchTvSeasonEpisodeEvent>((event, emit) async {
      emit(TvSeasonEpisodeLoading());

      final result =
          await getTvSeasonEpisodes.execute(event.idTv, event.seasonNumber);
      result.fold(
        (failure) => emit(TvSeasonEpisodeError(failure.message)),
        (data) => emit(TvSeasonEpisodeLoaded(data)),
      );
    });
  }
}
