part of 'tv_season_episode_bloc.dart';

class FetchTvSeasonEpisodeEvent {
  final int idTv;
  final int seasonNumber;

  const FetchTvSeasonEpisodeEvent(
      {required this.idTv, required this.seasonNumber});
}
