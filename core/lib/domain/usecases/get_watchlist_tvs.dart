import 'package:dartz/dartz.dart';
import '../entities/tv.dart';
import '../../utils/failure.dart';
import '../repositories/tv_repository.dart';

class GetWatchlistTvs {
  final TvRepository _repository;

  GetWatchlistTvs(this._repository);

  Future<Either<Failure, List<Tv>>> execute() {
    return _repository.getWatchlistTvs();
  }
}
