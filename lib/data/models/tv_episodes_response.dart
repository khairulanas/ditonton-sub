import 'package:ditonton/data/models/tv_episode_model.dart';
import 'package:equatable/equatable.dart';

class TvEpisodesResponse extends Equatable {
  TvEpisodesResponse({
    required this.episodes,
  });

  final List<TvEpisodeModel> episodes;

  factory TvEpisodesResponse.fromJson(Map<String, dynamic> json) =>
      TvEpisodesResponse(
        episodes: List<TvEpisodeModel>.from(
            json["episodes"].map((x) => TvEpisodeModel.fromJson(x))),
      );

  @override
  List<Object?> get props => [episodes];
}
