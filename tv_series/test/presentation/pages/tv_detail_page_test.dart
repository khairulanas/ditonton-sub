import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tv_series/presentation/bloc/tv_detail_bloc/tv_detail_bloc.dart';
import 'package:tv_series/presentation/pages/tv_detail_page.dart';

import '../../dummy_data/dummy_objects.dart';

class MockTvDetailBloc extends MockBloc<TvDetailEvent, TvDetailState>
    implements TvDetailBloc {}

class TvDetailEventFake extends Fake implements TvDetailEvent {}

class TvDetailStateFake extends Fake implements TvDetailState {}

void main() {
  late MockTvDetailBloc mockBloc;
  setUpAll(() {
    registerFallbackValue<TvDetailEvent>(TvDetailEventFake());
    registerFallbackValue<TvDetailState>(TvDetailStateFake());
  });

  setUp(() {
    mockBloc = MockTvDetailBloc();
  });

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<TvDetailBloc>.value(
      value: mockBloc,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Page should display progress bar when loading',
      (WidgetTester tester) async {
    when(() => mockBloc.state).thenReturn(
        TvDetailState.initial().copyWith(tvState: RequestState.Loading));

    final progressBarFinder = find.byType(CircularProgressIndicator);

    await tester.pumpWidget(_makeTestableWidget(TvDetailPage(
      id: 1,
    )));

    expect(progressBarFinder, findsWidgets);
  });

  testWidgets('should display loading when recommendationState loading',
      (WidgetTester tester) async {
    when(() => mockBloc.state).thenReturn(TvDetailState.initial().copyWith(
      tvState: RequestState.Loaded,
      tv: testTvDetail,
      recommendationState: RequestState.Loading,
      isAddedToWatchlist: false,
    ));

    final progressBarFinder = find.byType(CircularProgressIndicator);

    await tester.pumpWidget(_makeTestableWidget(TvDetailPage(id: 1)));

    expect(progressBarFinder, findsWidgets);
  });
  testWidgets(
      'Watchlist button should display add icon when tv not added to watchlist',
      (WidgetTester tester) async {
    when(() => mockBloc.state).thenReturn(TvDetailState.initial().copyWith(
      tvState: RequestState.Loaded,
      tv: testTvDetail,
      recommendationState: RequestState.Loaded,
      tvRecommendations: [testTv],
      isAddedToWatchlist: false,
    ));

    final watchlistButtonIcon = find.byIcon(Icons.add);

    await tester.pumpWidget(_makeTestableWidget(TvDetailPage(id: 1)));

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should dispay check icon when tv is added to wathclist',
      (WidgetTester tester) async {
    when(() => mockBloc.state).thenReturn(TvDetailState.initial().copyWith(
      tvState: RequestState.Loaded,
      tv: testTvDetail,
      recommendationState: RequestState.Loaded,
      tvRecommendations: [testTv],
      isAddedToWatchlist: true,
    ));

    final watchlistButtonIcon = find.byIcon(Icons.check);

    await tester.pumpWidget(_makeTestableWidget(TvDetailPage(id: 1)));

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display Snackbar when added to watchlist',
      (WidgetTester tester) async {
    whenListen(
        mockBloc,
        Stream.fromIterable([
          TvDetailState.initial().copyWith(
            tvState: RequestState.Loaded,
            tv: testTvDetail,
            recommendationState: RequestState.Loaded,
            tvRecommendations: [testTv],
            isAddedToWatchlist: false,
          ),
          TvDetailState.initial().copyWith(
            tvState: RequestState.Loaded,
            tv: testTvDetail,
            recommendationState: RequestState.Loaded,
            tvRecommendations: [testTv],
            isAddedToWatchlist: false,
            watchlistMessage: 'Added to Watchlist',
          ),
        ]),
        initialState: TvDetailState.initial());

    final watchlistButton = find.byType(ElevatedButton);

    await tester.pumpWidget(_makeTestableWidget(TvDetailPage(id: 1)));
    await tester.pump();

    expect(find.byIcon(Icons.add), findsOneWidget);

    await tester.tap(watchlistButton);
    await tester.pump();

    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text('Added to Watchlist'), findsOneWidget);
  });
  testWidgets(
      'Watchlist button should display Snackbar when removed from watchlist',
      (WidgetTester tester) async {
    whenListen(
        mockBloc,
        Stream.fromIterable([
          TvDetailState.initial().copyWith(
            tvState: RequestState.Loaded,
            tv: testTvDetail,
            recommendationState: RequestState.Loaded,
            tvRecommendations: [testTv],
            isAddedToWatchlist: false,
          ),
          TvDetailState.initial().copyWith(
            tvState: RequestState.Loaded,
            tv: testTvDetail,
            recommendationState: RequestState.Loaded,
            tvRecommendations: [testTv],
            isAddedToWatchlist: false,
            watchlistMessage: 'Removed from Watchlist',
          ),
        ]),
        initialState: TvDetailState.initial());

    final watchlistButton = find.byType(ElevatedButton);

    await tester.pumpWidget(_makeTestableWidget(TvDetailPage(id: 1)));
    await tester.pump();

    expect(find.byIcon(Icons.add), findsOneWidget);

    await tester.tap(watchlistButton);
    await tester.pump();

    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text('Removed from Watchlist'), findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display AlertDialog when add to watchlist failed',
      (WidgetTester tester) async {
    whenListen(
        mockBloc,
        Stream.fromIterable([
          TvDetailState.initial().copyWith(
            tvState: RequestState.Loaded,
            tv: testTvDetail,
            recommendationState: RequestState.Loaded,
            tvRecommendations: [testTv],
            isAddedToWatchlist: false,
          ),
          TvDetailState.initial().copyWith(
            tvState: RequestState.Loaded,
            tv: testTvDetail,
            recommendationState: RequestState.Loaded,
            tvRecommendations: [testTv],
            isAddedToWatchlist: false,
            watchlistMessage: 'Failed',
          ),
          TvDetailState.initial().copyWith(
            tvState: RequestState.Loaded,
            tv: testTvDetail,
            recommendationState: RequestState.Loaded,
            tvRecommendations: [testTv],
            isAddedToWatchlist: false,
            watchlistMessage: 'Failed ',
          ),
        ]),
        initialState: TvDetailState.initial());

    final watchlistButton = find.byIcon(Icons.add);

    await tester.pumpWidget(_makeTestableWidget(TvDetailPage(id: 1)));
    await tester.pump();

    expect(find.byIcon(Icons.add), findsOneWidget);

    await tester.tap(watchlistButton, warnIfMissed: false);
    await tester.pump();

    expect(find.byType(AlertDialog), findsOneWidget);
    expect(find.text('Failed'), findsOneWidget);
  });
}
