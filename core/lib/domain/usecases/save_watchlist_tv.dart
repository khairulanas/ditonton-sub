import 'package:dartz/dartz.dart';
import '../../utils/failure.dart';
import '../entities/tv_detail.dart';
import '../repositories/tv_repository.dart';

class SaveWatchlistTv {
  final TvRepository repository;

  SaveWatchlistTv(this.repository);

  Future<Either<Failure, String>> execute(TvDetail movie) {
    return repository.saveWatchlist(movie);
  }
}
