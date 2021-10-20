part of 'tv_season_episode_bloc.dart';

abstract class TvSeasonEpisodeState extends Equatable {
  const TvSeasonEpisodeState();

  @override
  List<Object> get props => [];
}

class TvSeasonEpisodeEmpty extends TvSeasonEpisodeState {}

class TvSeasonEpisodeLoading extends TvSeasonEpisodeState {}

class TvSeasonEpisodeError extends TvSeasonEpisodeState {
  final String message;

  const TvSeasonEpisodeError(this.message);
  @override
  List<Object> get props => [message];
}

class TvSeasonEpisodeLoaded extends TvSeasonEpisodeState {
  final List<TvEpisode> tvEpisode;

  const TvSeasonEpisodeLoaded(this.tvEpisode);
  @override
  List<Object> get props => [tvEpisode];
}
