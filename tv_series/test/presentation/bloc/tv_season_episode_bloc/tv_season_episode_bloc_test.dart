import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:core/domain/entities/tv_episode.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:tv_series/domain/usecases/get_tv_season_episodes.dart';
import 'package:tv_series/presentation/bloc/tv_season_episode_bloc/tv_season_episode_bloc.dart';

import 'tv_season_episode_bloc_test.mocks.dart';

@GenerateMocks([GetTvSeasonEpisodes])
void main() {
  late TvSeasonEpisodeBloc tvSeasonEpisodeBloc;
  late MockGetTvSeasonEpisodes mockGetTvSeasonEpisodes;

  setUp(() {
    mockGetTvSeasonEpisodes = MockGetTvSeasonEpisodes();
    tvSeasonEpisodeBloc = TvSeasonEpisodeBloc(mockGetTvSeasonEpisodes);
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

  blocTest<TvSeasonEpisodeBloc, TvSeasonEpisodeState>(
    'should emit [AiringTodayTvsLoading,AiringTodayTvsError] when fail',
    build: () {
      when(mockGetTvSeasonEpisodes.execute(1, 1))
          .thenAnswer((_) async => Left(ServerFailure('fail')));
      return tvSeasonEpisodeBloc;
    },
    act: (bloc) =>
        bloc.add(FetchTvSeasonEpisodeEvent(idTv: 1, seasonNumber: 1)),
    expect: () => [
      TvSeasonEpisodeLoading(),
      TvSeasonEpisodeError('fail'),
    ],
    verify: (_) {
      verify(mockGetTvSeasonEpisodes.execute(1, 1));
    },
  );
  blocTest<TvSeasonEpisodeBloc, TvSeasonEpisodeState>(
    'should emit [AiringTodayTvsLoading,AiringTodayTvsLoaded] when success',
    build: () {
      when(mockGetTvSeasonEpisodes.execute(1, 1))
          .thenAnswer((_) async => Right(tTvEpisodeList));
      return tvSeasonEpisodeBloc;
    },
    act: (bloc) =>
        bloc.add(FetchTvSeasonEpisodeEvent(idTv: 1, seasonNumber: 1)),
    expect: () => [
      TvSeasonEpisodeLoading(),
      TvSeasonEpisodeLoaded(tTvEpisodeList),
    ],
    verify: (_) {
      verify(mockGetTvSeasonEpisodes.execute(1, 1));
    },
  );
}
