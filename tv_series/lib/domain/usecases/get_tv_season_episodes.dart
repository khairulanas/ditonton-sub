import 'package:core/core.dart';

import 'package:core/domain/entities/tv_episode.dart';
import 'package:core/domain/repositories/tv_repository.dart';
import 'package:dartz/dartz.dart';

class GetTvSeasonEpisodes {
  final TvRepository repository;

  GetTvSeasonEpisodes(this.repository);

  Future<Either<Failure, List<TvEpisode>>> execute(int idTv, int seasonNumber) {
    return repository.getTvSeasonEpisodes(idTv, seasonNumber);
  }
}
