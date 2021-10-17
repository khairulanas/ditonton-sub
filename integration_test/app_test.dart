import 'package:core/presentation/widgets/movie_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:ditonton/main.dart' as app;

// run: flutter test integration_test

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('tap on the watchlist action button; verify watchlist',
        (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Finds the first item movie on home page.
      final Finder itemMovie = find.byKey(Key('movie0')).first;
      // Emulate a tap on the item movie.
      await tester.tap(itemMovie);

      // wait detail page loaded
      await tester.pumpAndSettle();

      // Finds the watchlist button
      final Finder watchListButton = find.byKey(Key('watchListButton'));
      // Emulate a tap on the watchlist button.
      await tester.tap(watchListButton);

      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.check), findsOneWidget);

      // back to home screen
      final Finder iconBack = find.byIcon(Icons.arrow_back).first;
      await tester.tap(iconBack);
      await tester.pumpAndSettle();

      //open drawer
      final Finder drawerIcon = find.byIcon(Icons.menu).first;
      await tester.tap(drawerIcon);
      await tester.pumpAndSettle();

      //click on watchlist menu
      final Finder watchlistMenuIcon = find.byIcon(Icons.save_alt).first;
      await tester.tap(watchlistMenuIcon);
      await tester.pumpAndSettle();

      expect(find.byType(MovieCard), findsOneWidget);
    });
  });
}
