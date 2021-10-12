import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tv_episode.dart';
import 'package:ditonton/domain/repositories/tv_repository.dart';

class GetTvSeasonEpisodes {
  final TvRepository repository;

  GetTvSeasonEpisodes(this.repository);

  Future<Either<Failure, List<TvEpisode>>> execute(int idTv, int seasonNumber) {
    return repository.getTvSeasonEpisodes(idTv, seasonNumber);
  }
}
