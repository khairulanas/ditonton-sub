import 'package:core/domain/entities/tv_episode.dart';
import 'package:core/presentation/widgets/episode_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final episode = TvEpisode(
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
  group('Episode card Widget Test', () {
    Widget _makeTestableWidget() {
      return MaterialApp(home: Scaffold(body: EpisodeCard(episode)));
    }

    testWidgets('Testing if title shows up', (WidgetTester tester) async {
      await tester.pumpWidget(_makeTestableWidget());
      expect(find.byType(Text), findsWidgets);
    });
  });
}
