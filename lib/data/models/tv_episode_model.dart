import 'package:ditonton/domain/entities/tv_episode.dart';
import 'package:equatable/equatable.dart';

class TvEpisodeModel extends Equatable {
  TvEpisodeModel({
    required this.airDate,
    required this.episodeNumber,
    required this.id,
    required this.name,
    required this.overview,
    required this.productionCode,
    required this.seasonNumber,
    required this.stillPath,
    required this.voteAverage,
    required this.voteCount,
  });

  final DateTime? airDate;
  final int episodeNumber;
  final int id;
  final String name;
  final String overview;
  final String productionCode;
  final int seasonNumber;
  final String stillPath;
  final double voteAverage;
  final int voteCount;

  factory TvEpisodeModel.fromJson(Map<String, dynamic> json) => TvEpisodeModel(
        airDate:
            json["air_date"] == null ? null : DateTime.parse(json["air_date"]),
        episodeNumber:
            json["episode_number"] == null ? null : json["episode_number"],
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        overview: json["overview"] == null ? null : json["overview"],
        productionCode:
            json["production_code"] == null ? null : json["production_code"],
        seasonNumber:
            json["season_number"] == null ? null : json["season_number"],
        stillPath: json["still_path"] == null ? null : json["still_path"],
        voteAverage: json["vote_average"] == null
            ? null
            : json["vote_average"].toDouble(),
        voteCount: json["vote_count"] == null ? null : json["vote_count"],
      );

  TvEpisode toEntity() => TvEpisode(
      airDate: this.airDate,
      episodeNumber: this.episodeNumber,
      id: this.id,
      name: this.name,
      overview: this.overview,
      productionCode: this.productionCode,
      seasonNumber: this.seasonNumber,
      stillPath: this.stillPath,
      voteAverage: this.voteAverage,
      voteCount: this.voteCount);

  @override
  List<Object?> get props => [
        airDate,
        episodeNumber,
        id,
        name,
        overview,
        productionCode,
        seasonNumber,
        stillPath,
        voteAverage,
        voteCount,
      ];
}
