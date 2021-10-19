import 'package:bloc_test/bloc_test.dart';
import 'package:core/utils/state_enum.dart';
import 'package:core/domain/entities/movie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie/presentation/bloc/movie_detail_bloc/movie_detail_bloc.dart';
import 'package:movie/presentation/pages/movie_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../dummy_data/dummy_objects.dart';

class MockMovieDetailBloc extends MockBloc<MovieDetailEvent, MovieDetailState>
    implements MovieDetailBloc {}

class MovieDetailStateFake extends Fake implements MovieDetailState {}

class MovieDetailEventFake extends Fake implements MovieDetailEvent {}

void main() {
  late MockMovieDetailBloc mocBloc;

  setUpAll(() {
    registerFallbackValue<MovieDetailState>(MovieDetailStateFake());
    registerFallbackValue<MovieDetailEvent>(MovieDetailEventFake());
  });

  setUp(() {
    mocBloc = MockMovieDetailBloc();
  });

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<MovieDetailBloc>(
      create: (_) => mocBloc,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets(
      'Watchlist button should display add icon when movie not added to watchlist',
      (WidgetTester tester) async {
    when(() => mocBloc.state.movieState).thenReturn(RequestState.Loaded);
    when(() => mocBloc.state.movie).thenReturn(testMovieDetail);
    when(() => mocBloc.state.recommendationState)
        .thenReturn(RequestState.Loaded);
    when(() => mocBloc.state.movieRecommendations).thenReturn(<Movie>[]);
    when(() => mocBloc.state.isAddedToWatchlist).thenReturn(false);

    final watchlistButtonIcon = find.byIcon(Icons.add);

    await tester.pumpWidget(_makeTestableWidget(MovieDetailPage(id: 1)));

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should dispay check icon when movie is added to wathclist',
      (WidgetTester tester) async {
    when(() => mocBloc.state.movieState).thenReturn(RequestState.Loaded);
    when(() => mocBloc.state.movie).thenReturn(testMovieDetail);
    when(() => mocBloc.state.recommendationState)
        .thenReturn(RequestState.Loaded);
    when(() => mocBloc.state.movieRecommendations).thenReturn(<Movie>[]);
    when(() => mocBloc.state.isAddedToWatchlist).thenReturn(true);

    final watchlistButtonIcon = find.byIcon(Icons.check);

    await tester.pumpWidget(_makeTestableWidget(MovieDetailPage(id: 1)));

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display Snackbar when added to watchlist',
      (WidgetTester tester) async {
    when(() => mocBloc.state.movieState).thenReturn(RequestState.Loaded);
    when(() => mocBloc.state.movie).thenReturn(testMovieDetail);
    when(() => mocBloc.state.recommendationState)
        .thenReturn(RequestState.Loaded);
    when(() => mocBloc.state.movieRecommendations).thenReturn(<Movie>[]);
    when(() => mocBloc.state.isAddedToWatchlist).thenReturn(false);
    when(() => mocBloc.state.watchlistMessage).thenReturn('Added to Watchlist');

    final watchlistButton = find.byType(ElevatedButton);

    await tester.pumpWidget(_makeTestableWidget(MovieDetailPage(id: 1)));

    expect(find.byIcon(Icons.add), findsOneWidget);

    await tester.tap(watchlistButton);
    await tester.pump();

    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text('Added to Watchlist'), findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display AlertDialog when add to watchlist failed',
      (WidgetTester tester) async {
    when(() => mocBloc.state.movie).thenReturn(testMovieDetail);
    when(() => mocBloc.state.recommendationState)
        .thenReturn(RequestState.Loaded);
    when(() => mocBloc.state.movieRecommendations).thenReturn(<Movie>[]);
    when(() => mocBloc.state.isAddedToWatchlist).thenReturn(false);
    when(() => mocBloc.state.watchlistMessage).thenReturn('Failed');

    final watchlistButton = find.byType(ElevatedButton);

    await tester.pumpWidget(_makeTestableWidget(MovieDetailPage(id: 1)));

    expect(find.byIcon(Icons.add), findsOneWidget);

    await tester.tap(watchlistButton);
    await tester.pump();

    expect(find.byType(AlertDialog), findsOneWidget);
    expect(find.text('Failed'), findsOneWidget);
  });
}
