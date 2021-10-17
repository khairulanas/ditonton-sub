import 'package:dartz/dartz.dart';
import '../../utils/failure.dart';
import '../entities/tv_detail.dart';
import '../repositories/tv_repository.dart';

class RemoveWatchlistTv {
  final TvRepository repository;

  RemoveWatchlistTv(this.repository);

  Future<Either<Failure, String>> execute(TvDetail movie) {
    return repository.removeWatchlist(movie);
  }
}
