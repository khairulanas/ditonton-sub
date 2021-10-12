import 'package:ditonton/data/models/genre_model.dart';
import 'package:ditonton/data/models/tv_created_by_model.dart';
import 'package:ditonton/data/models/tv_last_episode_to_air_model.dart';
import 'package:ditonton/data/models/tv_network_model.dart';
import 'package:ditonton/data/models/tv_production_country_model.dart';
import 'package:ditonton/data/models/tv_season_model.dart';
import 'package:ditonton/data/models/tv_spoken_languange_model.dart';
import 'package:ditonton/domain/entities/tv_detail.dart';
import 'package:equatable/equatable.dart';

class TvDetailModel extends Equatable {
  TvDetailModel({
    required this.backdropPath,
    required this.createdBy,
    required this.episodeRunTime,
    required this.firstAirDate,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.inProduction,
    required this.languages,
    required this.lastAirDate,
    required this.lastEpisodeToAir,
    required this.name,
    required this.nextEpisodeToAir,
    required this.networks,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.seasons,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.type,
    required this.voteAverage,
    required this.voteCount,
  });

  final String backdropPath;
  final List<CreatedByModel>? createdBy;
  final List<int> episodeRunTime;
  final DateTime firstAirDate;
  final List<GenreModel> genres;
  final String homepage;
  final int id;
  final bool inProduction;
  final List<String> languages;
  final DateTime lastAirDate;
  final TvLastEpisodeToAirModel lastEpisodeToAir;
  final String name;
  final dynamic nextEpisodeToAir;
  final List<TvNetworkModel> networks;
  final int numberOfEpisodes;
  final int numberOfSeasons;
  final List<String> originCountry;
  final String originalLanguage;
  final String originalName;
  final String overview;
  final double popularity;
  final String posterPath;
  final List<TvNetworkModel> productionCompanies;
  final List<TvProductionCountryModel> productionCountries;
  final List<TvSeasonModel> seasons;
  final List<TvSpokenLanguageModel> spokenLanguages;
  final String status;
  final String tagline;
  final String type;
  final double voteAverage;
  final int voteCount;

  factory TvDetailModel.fromJson(Map<String, dynamic> json) => TvDetailModel(
        backdropPath: json["backdrop_path"],
        createdBy: json["created_by"] == null
            ? null
            : List<CreatedByModel>.from(
                json["created_by"].map((x) => CreatedByModel.fromJson(x))),
        episodeRunTime: List<int>.from(json["episode_run_time"].map((x) => x)),
        firstAirDate: DateTime.parse(json["first_air_date"]),
        genres: List<GenreModel>.from(
            json["genres"].map((x) => GenreModel.fromJson(x))),
        homepage: json["homepage"],
        id: json["id"],
        inProduction: json["in_production"],
        languages: List<String>.from(json["languages"].map((x) => x)),
        lastAirDate: DateTime.parse(json["last_air_date"]),
        lastEpisodeToAir:
            TvLastEpisodeToAirModel.fromJson(json["last_episode_to_air"]),
        name: json["name"],
        nextEpisodeToAir: json["next_episode_to_air"],
        networks: List<TvNetworkModel>.from(
            json["networks"].map((x) => TvNetworkModel.fromJson(x))),
        numberOfEpisodes: json["number_of_episodes"],
        numberOfSeasons: json["number_of_seasons"],
        originCountry: List<String>.from(json["origin_country"].map((x) => x)),
        originalLanguage: json["original_language"],
        originalName: json["original_name"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        productionCompanies: List<TvNetworkModel>.from(
            json["production_companies"]
                .map((x) => TvNetworkModel.fromJson(x))),
        productionCountries: List<TvProductionCountryModel>.from(
            json["production_countries"]
                .map((x) => TvProductionCountryModel.fromJson(x))),
        seasons: List<TvSeasonModel>.from(
            json["seasons"].map((x) => TvSeasonModel.fromJson(x))),
        spokenLanguages: List<TvSpokenLanguageModel>.from(
            json["spoken_languages"]
                .map((x) => TvSpokenLanguageModel.fromJson(x))),
        status: json["status"],
        tagline: json["tagline"],
        type: json["type"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
      );

  TvDetail toEntity() => TvDetail(
      backdropPath: this.backdropPath,
      createdBy: this.createdBy?.map((creator) => creator.toEntity()).toList(),
      episodeRunTime: this.episodeRunTime,
      firstAirDate: this.firstAirDate,
      genres: this.genres.map((genre) => genre.toEntity()).toList(),
      homepage: this.homepage,
      id: this.id,
      inProduction: this.inProduction,
      languages: this.languages,
      lastAirDate: this.lastAirDate,
      lastEpisodeToAir: this.lastEpisodeToAir.toEntity(),
      name: this.name,
      nextEpisodeToAir: this.nextEpisodeToAir,
      networks: this.networks.map((network) => network.toEntity()).toList(),
      numberOfEpisodes: this.numberOfEpisodes,
      numberOfSeasons: this.numberOfSeasons,
      originCountry: this.originCountry,
      originalLanguage: this.originalLanguage,
      originalName: this.originalName,
      overview: this.overview,
      popularity: this.popularity,
      posterPath: this.posterPath,
      productionCompanies: this
          .productionCompanies
          .map((productionCompany) => productionCompany.toEntity())
          .toList(),
      productionCountries: this
          .productionCountries
          .map((productionCountry) => productionCountry.toEntity())
          .toList(),
      seasons: this.seasons.map((season) => season.toEntity()).toList(),
      spokenLanguages: this
          .spokenLanguages
          .map((spokenLanguage) => spokenLanguage.toEntity())
          .toList(),
      status: this.status,
      tagline: this.tagline,
      type: this.type,
      voteAverage: this.voteAverage,
      voteCount: this.voteCount);

  @override
  List<Object?> get props => [
        backdropPath,
        createdBy,
        episodeRunTime,
        firstAirDate,
        genres,
        homepage,
        id,
        inProduction,
        languages,
        lastAirDate,
        lastEpisodeToAir,
        name,
        nextEpisodeToAir,
        networks,
        numberOfEpisodes,
        numberOfSeasons,
        originCountry,
        originalLanguage,
        originalName,
        overview,
        popularity,
        posterPath,
        productionCompanies,
        productionCountries,
        seasons,
        spokenLanguages,
        status,
        tagline,
        type,
        voteAverage,
        voteCount,
      ];
}
