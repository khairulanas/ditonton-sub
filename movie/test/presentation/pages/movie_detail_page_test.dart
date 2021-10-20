import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie/presentation/bloc/movie_detail_bloc/movie_detail_bloc.dart';
import 'package:movie/presentation/pages/movie_detail_page.dart';

import '../../dummy_data/dummy_objects.dart';

class MockMovieDetailBloc extends MockBloc<MovieDetailEvent, MovieDetailState>
    implements MovieDetailBloc {}

class MovieDetailEventFake extends Fake implements MovieDetailEvent {}

class MovieDetailStateFake extends Fake implements MovieDetailState {}

void main() {
  late MockMovieDetailBloc mockBloc;
  setUpAll(() {
    registerFallbackValue<MovieDetailEvent>(MovieDetailEventFake());
    registerFallbackValue<MovieDetailState>(MovieDetailStateFake());
  });

  setUp(() {
    mockBloc = MockMovieDetailBloc();
  });

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<MovieDetailBloc>.value(
      value: mockBloc,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Page should display progress bar when loading',
      (WidgetTester tester) async {
    when(() => mockBloc.state).thenReturn(
        MovieDetailState.initial().copyWith(movieState: RequestState.Loading));

    final progressBarFinder = find.byType(CircularProgressIndicator);

    await tester.pumpWidget(_makeTestableWidget(MovieDetailPage(
      id: 1,
    )));

    expect(progressBarFinder, findsWidgets);
  });

  testWidgets(
      'Watchlist button should display add icon when movie not added to watchlist',
      (WidgetTester tester) async {
    when(() => mockBloc.state).thenReturn(MovieDetailState.initial().copyWith(
      movieState: RequestState.Loaded,
      movie: testMovieDetail,
      recommendationState: RequestState.Loaded,
      movieRecommendations: [testMovie],
      isAddedToWatchlist: false,
    ));

    final watchlistButtonIcon = find.byIcon(Icons.add);

    await tester.pumpWidget(_makeTestableWidget(MovieDetailPage(id: 1)));

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should dispay check icon when movie is added to wathclist',
      (WidgetTester tester) async {
    when(() => mockBloc.state).thenReturn(MovieDetailState.initial().copyWith(
      movieState: RequestState.Loaded,
      movie: testMovieDetail,
      recommendationState: RequestState.Loaded,
      movieRecommendations: [testMovie],
      isAddedToWatchlist: true,
    ));

    final watchlistButtonIcon = find.byIcon(Icons.check);

    await tester.pumpWidget(_makeTestableWidget(MovieDetailPage(id: 1)));

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display Snackbar when added to watchlist',
      (WidgetTester tester) async {
    whenListen(
        mockBloc,
        Stream.fromIterable([
          MovieDetailState.initial().copyWith(
            movieState: RequestState.Loaded,
            movie: testMovieDetail,
            recommendationState: RequestState.Loaded,
            movieRecommendations: [testMovie],
            isAddedToWatchlist: false,
          ),
          MovieDetailState.initial().copyWith(
            movieState: RequestState.Loaded,
            movie: testMovieDetail,
            recommendationState: RequestState.Loaded,
            movieRecommendations: [testMovie],
            isAddedToWatchlist: false,
            watchlistMessage: 'Added to Watchlist',
          ),
        ]),
        initialState: MovieDetailState.initial());

    final watchlistButton = find.byType(ElevatedButton);

    await tester.pumpWidget(_makeTestableWidget(MovieDetailPage(id: 1)));
    await tester.pump();

    expect(find.byIcon(Icons.add), findsOneWidget);

    await tester.tap(watchlistButton);
    await tester.pump();

    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text('Added to Watchlist'), findsOneWidget);
  });

  // testWidgets(
  //     'Watchlist button should display AlertDialog when add to watchlist failed',
  //     (WidgetTester tester) async {
  //   whenListen(
  //       mockBloc,
  //       Stream.fromIterable([
  //         MovieDetailState.initial().copyWith(
  //           movieState: RequestState.Loaded,
  //           movie: testMovieDetail,
  //           recommendationState: RequestState.Loaded,
  //           movieRecommendations: [testMovie],
  //           isAddedToWatchlist: false,
  //         ),
  //         MovieDetailState.initial().copyWith(
  //           movieState: RequestState.Loaded,
  //           movie: testMovieDetail,
  //           recommendationState: RequestState.Loaded,
  //           movieRecommendations: [testMovie],
  //           isAddedToWatchlist: false,
  //           watchlistMessage: 'Failed',
  //         ),
  //       ]),
  //       initialState: MovieDetailState.initial());

  //   final watchlistButton = find.byIcon(Icons.add);

  //   await tester.pumpWidget(_makeTestableWidget(MovieDetailPage(id: 1)));
  //   await tester.pump();

  //   expect(find.byIcon(Icons.add), findsOneWidget);

  //   await tester.tap(watchlistButton);
  //   await tester.pump();

  //   expect(find.byType(AlertDialog), findsOneWidget);
  //   expect(find.text('Failed'), findsOneWidget);
  // });
}