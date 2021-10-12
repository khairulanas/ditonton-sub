import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/presentation/widgets/tv_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final tv = Tv(
    backdropPath: 'backdropPath',
    firstAirDate: DateTime.now(),
    genreIds: [10, 20],
    id: 1,
    name: 'name',
    originCountry: ['a', 'b'],
    originalLanguage: 'originalLanguage',
    originalName: 'originalName',
    overview: 'overview',
    popularity: 5.0,
    posterPath: 'posterPath',
    voteAverage: 5.0,
    voteCount: 1,
  );
  group('Tv card Widget Test', () {
    Widget _makeTestableWidget() {
      return MaterialApp(home: Scaffold(body: TvCard(tv)));
    }

    testWidgets('Testing if title shows up', (WidgetTester tester) async {
      await tester.pumpWidget(_makeTestableWidget());
      expect(find.byType(Text), findsWidgets);
      expect(find.byType(InkWell), findsOneWidget);
    });
  });
}
