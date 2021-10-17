import 'package:dartz/dartz.dart';
import '../entities/tv.dart';
import '../../utils/failure.dart';
import '../repositories/tv_repository.dart';

class GetAiringTodayTvs {
  final TvRepository repository;

  GetAiringTodayTvs(this.repository);

  Future<Either<Failure, List<Tv>>> execute() {
    return repository.getAiringTodayTvs();
  }
}
