import 'package:dartz/dartz.dart';
import '../../utils/failure.dart';
import '../entities/tv_episode.dart';
import '../repositories/tv_repository.dart';

class GetTvSeasonEpisodes {
  final TvRepository repository;

  GetTvSeasonEpisodes(this.repository);

  Future<Either<Failure, List<TvEpisode>>> execute(int idTv, int seasonNumber) {
    return repository.getTvSeasonEpisodes(idTv, seasonNumber);
  }
}
