import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_episode.dart';
import 'package:ditonton/domain/usecases/get_tv_season_episodes.dart';
import 'package:ditonton/presentation/provider/tv_season_episodes_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'tv_season_episodes_notifier_test.mocks.dart';

@GenerateMocks([GetTvSeasonEpisodes])
void main() {
  late TvSeasonEpisodesNotifier provider;
  late MockGetTvSeasonEpisodes mockGetTvSeasonEpisodes;
  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;
    mockGetTvSeasonEpisodes = MockGetTvSeasonEpisodes();
    provider =
        TvSeasonEpisodesNotifier(getTvSeasonEpisodes: mockGetTvSeasonEpisodes)
          ..addListener(() {
            listenerCallCount += 1;
          });
  });

  final tTvEpisode = TvEpisode(
      airDate: DateTime.parse("2021-02-12"),
      episodeNumber: 1,
      id: 2723622,
      name: "Episode 5.5: Guidepost",
      overview:
          "A special episode detailing the events leading up to the current situation with the Grace Field Farm children.",
      productionCode: "",
      seasonNumber: 0,
      stillPath: "/aHqMdHgzOTGLFYCZxXrUyywq67l.jpg",
      voteAverage: 0.0,
      voteCount: 0);
  final tTvEpisodeList = <TvEpisode>[tTvEpisode];
  final idTv = 1;
  final seasonNumber = 1;

  group('TvSeasonEpisodesNotifier', () {
    test('should change state to loading when usecase is called', () async {
      // arrange
      when(mockGetTvSeasonEpisodes.execute(idTv, seasonNumber))
          .thenAnswer((_) async => Right(tTvEpisodeList));
      // act
      provider.fetchTvSeasonEpisode(idTv, seasonNumber);
      // assert
      expect(provider.state, RequestState.Loading);
    });

    test('should change search result data when data is gotten successfully',
        () async {
      // arrange
      when(mockGetTvSeasonEpisodes.execute(idTv, seasonNumber))
          .thenAnswer((_) async => Right(tTvEpisodeList));
      // act
      await provider.fetchTvSeasonEpisode(idTv, seasonNumber);
      // assert
      expect(provider.state, RequestState.Loaded);
      expect(provider.seasonEpisodes, tTvEpisodeList);
      expect(listenerCallCount, 2);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetTvSeasonEpisodes.execute(idTv, seasonNumber))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      // act
      await provider.fetchTvSeasonEpisode(idTv, seasonNumber);
      // assert
      expect(provider.state, RequestState.Error);
      expect(provider.message, 'Server Failure');
      expect(listenerCallCount, 2);
    });
  });
}
