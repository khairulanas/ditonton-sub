import 'package:dartz/dartz.dart';
import '../../utils/failure.dart';
import '../entities/tv.dart';
import '../entities/tv_detail.dart';
import '../entities/tv_episode.dart';

abstract class TvRepository {
  Future<Either<Failure, List<Tv>>> getAiringTodayTvs();
  Future<Either<Failure, List<Tv>>> getPopularTvs();
  Future<Either<Failure, List<Tv>>> getTopRatedTvs();
  Future<Either<Failure, TvDetail>> getTvDetail(int id);
  Future<Either<Failure, List<Tv>>> getTvRecommendations(int id);
  Future<Either<Failure, List<TvEpisode>>> getTvSeasonEpisodes(
      int idTv, int seasonNumber);
  Future<Either<Failure, List<Tv>>> searchTvs(String query);
  Future<Either<Failure, String>> saveWatchlist(TvDetail movie);
  Future<Either<Failure, String>> removeWatchlist(TvDetail movie);
  Future<bool> isAddedToWatchlist(int id);
  Future<Either<Failure, List<Tv>>> getWatchlistTvs();
}
