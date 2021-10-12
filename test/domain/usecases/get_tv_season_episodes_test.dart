import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/domain/entities/tv_episode.dart';
import 'package:ditonton/domain/usecases/get_tv_recommendations.dart';
import 'package:ditonton/domain/usecases/get_tv_season_episodes.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetTvSeasonEpisodes usecase;
  late MockTvRepository mockTvRepository;

  setUp(() {
    mockTvRepository = MockTvRepository();
    usecase = GetTvSeasonEpisodes(mockTvRepository);
  });

  final tIdTv = 1;
  final tSeasonNumber = 1;
  final tTvEpisodes = <TvEpisode>[];

  test('should get list of tv series recommendations from the repository',
      () async {
    // arrange
    when(mockTvRepository.getTvSeasonEpisodes(tIdTv, tSeasonNumber))
        .thenAnswer((_) async => Right(tTvEpisodes));
    // act
    final result = await usecase.execute(tIdTv, tSeasonNumber);
    // assert
    expect(result, Right(tTvEpisodes));
  });
}
