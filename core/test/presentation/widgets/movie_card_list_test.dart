import 'package:core/domain/entities/movie.dart';
import 'package:core/presentation/widgets/movie_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final movie = Movie(
    adult: false,
    backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
    genreIds: [14, 28],
    id: 557,
    originalTitle: 'Spider-Man',
    overview:
        'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
    popularity: 60.441,
    posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
    releaseDate: '2002-05-01',
    title: 'Spider-Man',
    video: false,
    voteAverage: 7.2,
    voteCount: 13507,
  );
  group('Episode card Widget Test', () {
    Widget _makeTestableWidget() {
      return MaterialApp(home: Scaffold(body: MovieCard(movie)));
    }

    testWidgets('Testing if title shows up', (WidgetTester tester) async {
      await tester.pumpWidget(_makeTestableWidget());
      expect(find.byType(Text), findsWidgets);
      expect(find.byType(InkWell), findsOneWidget);
    });
  });
}
