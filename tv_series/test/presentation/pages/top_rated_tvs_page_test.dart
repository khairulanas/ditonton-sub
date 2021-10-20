import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tv_series/presentation/bloc/tv_list_bloc/tv_list_bloc.dart';
import 'package:tv_series/presentation/pages/top_rated_tvs_page.dart';

import '../../dummy_data/dummy_objects.dart';

class MockTopRatedTvsBloc extends MockBloc<FetchTvListEvent, TvListState>
    implements TopRatedTvListBloc {}

class FetchTvListEventFake extends Fake implements FetchTvListEvent {}

class TvListStateFake extends Fake implements TvListState {}

void main() {
  late MockTopRatedTvsBloc mockBloc;
  setUpAll(() {
    registerFallbackValue<FetchTvListEvent>(FetchTvListEventFake());
    registerFallbackValue<TvListState>(TvListStateFake());
  });

  setUp(() {
    mockBloc = MockTopRatedTvsBloc();
  });

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<TopRatedTvListBloc>.value(
      value: mockBloc,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Page should display center progress bar when loading',
      (WidgetTester tester) async {
    when(() => mockBloc.state).thenReturn(TvListLoading());

    final progressBarFinder = find.byType(CircularProgressIndicator);
    final centerFinder = find.byType(Center);

    await tester.pumpWidget(_makeTestableWidget(TopRatedTvsPage()));

    expect(centerFinder, findsOneWidget);
    expect(progressBarFinder, findsOneWidget);
  });

  testWidgets('Page should display ListView when data is loaded',
      (WidgetTester tester) async {
    when(() => mockBloc.state).thenReturn(TvListLoaded(tvs: [testTv]));

    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(_makeTestableWidget(TopRatedTvsPage()));

    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('Page should display text with message when Error',
      (WidgetTester tester) async {
    when(() => mockBloc.state).thenReturn(TvListError('Error message'));

    final textFinder = find.byKey(Key('error_message'));

    await tester.pumpWidget(_makeTestableWidget(TopRatedTvsPage()));

    expect(textFinder, findsOneWidget);
  });
}
