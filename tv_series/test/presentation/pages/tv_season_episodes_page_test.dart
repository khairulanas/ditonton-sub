import 'package:bloc_test/bloc_test.dart';
import 'package:core/domain/entities/tv_episode.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tv_series/presentation/bloc/tv_season_episode_bloc/tv_season_episode_bloc.dart';
import 'package:tv_series/presentation/pages/tv_season_episodes_page.dart';

class MockTvSeasonEpisodeBloc
    extends MockBloc<FetchTvSeasonEpisodeEvent, TvSeasonEpisodeState>
    implements TvSeasonEpisodeBloc {}

class FetchTvSeasonEpisodeEventFake extends Fake
    implements FetchTvSeasonEpisodeEvent {}

class TvSeasonEpisodeStateFake extends Fake implements TvSeasonEpisodeState {}

void main() {
  late MockTvSeasonEpisodeBloc mockBloc;
  setUpAll(() {
    registerFallbackValue<FetchTvSeasonEpisodeEvent>(
        FetchTvSeasonEpisodeEventFake());
    registerFallbackValue<TvSeasonEpisodeState>(TvSeasonEpisodeStateFake());
  });

  setUp(() {
    mockBloc = MockTvSeasonEpisodeBloc();
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

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<TvSeasonEpisodeBloc>.value(
      value: mockBloc,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Page should display center progress bar when loading',
      (WidgetTester tester) async {
    when(() => mockBloc.state).thenReturn(TvSeasonEpisodeLoading());

    final progressBarFinder = find.byType(CircularProgressIndicator);
    final centerFinder = find.byType(Center);

    await tester.pumpWidget(_makeTestableWidget(TvSeasonEpisodesPage(
        idTv: 1, seasonNumber: 1, seasonName: 'seasonName')));

    expect(centerFinder, findsOneWidget);
    expect(progressBarFinder, findsOneWidget);
  });

  testWidgets('Page should display ListView when data is loaded',
      (WidgetTester tester) async {
    when(() => mockBloc.state)
        .thenReturn(TvSeasonEpisodeLoaded(tTvEpisodeList));

    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(_makeTestableWidget(TvSeasonEpisodesPage(
        idTv: 1, seasonNumber: 1, seasonName: 'seasonName')));

    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('Page should display text with message when Error',
      (WidgetTester tester) async {
    when(() => mockBloc.state)
        .thenReturn(TvSeasonEpisodeError('Error message'));

    final textFinder = find.byKey(Key('error_message'));

    await tester.pumpWidget(_makeTestableWidget(TvSeasonEpisodesPage(
        idTv: 1, seasonNumber: 1, seasonName: 'seasonName')));

    expect(textFinder, findsOneWidget);
  });
}
