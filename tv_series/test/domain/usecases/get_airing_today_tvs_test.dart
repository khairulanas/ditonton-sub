import 'package:dartz/dartz.dart';
import 'package:core/domain/entities/tv.dart';
import 'package:tv_series/domain/usecases/get_airing_today_tvs.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetAiringTodayTvs usecase;
  late MockTvRepository mockTvRepository;

  setUp(() {
    mockTvRepository = MockTvRepository();
    usecase = GetAiringTodayTvs(mockTvRepository);
  });

  final tTvs = <Tv>[];

  group('GetAiringTodayTvs Test: ', () {
    test('should get list of tv series from the repository', () async {
      // arrange
      when(mockTvRepository.getAiringTodayTvs())
          .thenAnswer((_) async => Right(tTvs));
      // act
      final result = await usecase.execute();
      // assert
      expect(result, Right(tTvs));
    });
  });
}
