import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_episode.dart';
import 'package:ditonton/presentation/pages/tv_season_episodes_page.dart';
import 'package:ditonton/presentation/provider/tv_season_episodes_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import 'tv_season_episodes_page_test.mocks.dart';

@GenerateMocks([TvSeasonEpisodesNotifier])
void main() {
  late MockTvSeasonEpisodesNotifier mockNotifier;
  final idTv = 83097;
  final seasonNumber = 0;
  final seasonName = "Specials";

  setUp(() {
    mockNotifier = MockTvSeasonEpisodesNotifier();
  });

  Widget _makeTestableWidget(Widget body) {
    return ChangeNotifierProvider<TvSeasonEpisodesNotifier>.value(
      value: mockNotifier,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Page should display progress bar when loading',
      (WidgetTester tester) async {
    when(mockNotifier.state).thenReturn(RequestState.Loading);

    final progressFinder = find.byType(CircularProgressIndicator);
    final centerFinder = find.byType(Center);

    await tester.pumpWidget(_makeTestableWidget(TvSeasonEpisodesPage(
        idTv: idTv, seasonNumber: seasonNumber, seasonName: seasonName)));

    expect(centerFinder, findsOneWidget);
    expect(progressFinder, findsOneWidget);
  });

  testWidgets('Page should display when data is loaded',
      (WidgetTester tester) async {
    when(mockNotifier.state).thenReturn(RequestState.Loaded);
    when(mockNotifier.seasonEpisodes).thenReturn(<TvEpisode>[]);

    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(_makeTestableWidget(TvSeasonEpisodesPage(
        idTv: idTv, seasonNumber: seasonNumber, seasonName: seasonName)));

    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('Page should display text with message when Error',
      (WidgetTester tester) async {
    when(mockNotifier.state).thenReturn(RequestState.Error);
    when(mockNotifier.message).thenReturn('Error message');

    final textFinder = find.byKey(Key('error_message'));

    await tester.pumpWidget(_makeTestableWidget(TvSeasonEpisodesPage(
        idTv: idTv, seasonNumber: seasonNumber, seasonName: seasonName)));

    expect(textFinder, findsOneWidget);
  });
}
