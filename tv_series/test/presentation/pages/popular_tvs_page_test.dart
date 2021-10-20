import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tv_series/presentation/bloc/tv_list_bloc/tv_list_bloc.dart';
import 'package:tv_series/presentation/pages/popular_tvs_page.dart';

import '../../dummy_data/dummy_objects.dart';

class MockPopularTvsBloc extends MockBloc<FetchTvListEvent, TvListState>
    implements PopularTvListBloc {}

class FetchTvListEventFake extends Fake implements FetchTvListEvent {}

class TvListStateFake extends Fake implements TvListState {}

void main() {
  late MockPopularTvsBloc mockBloc;
  setUpAll(() {
    registerFallbackValue<FetchTvListEvent>(FetchTvListEventFake());
    registerFallbackValue<TvListState>(TvListStateFake());
  });

  setUp(() {
    mockBloc = MockPopularTvsBloc();
  });

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<PopularTvListBloc>.value(
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

    await tester.pumpWidget(_makeTestableWidget(PopularTvsPage()));

    expect(centerFinder, findsOneWidget);
    expect(progressBarFinder, findsOneWidget);
  });

  testWidgets('Page should display ListView when data is loaded',
      (WidgetTester tester) async {
    when(() => mockBloc.state).thenReturn(TvListLoaded(tvs: [testTv]));

    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(_makeTestableWidget(PopularTvsPage()));

    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('Page should display text with message when Error',
      (WidgetTester tester) async {
    when(() => mockBloc.state).thenReturn(TvListError('Error message'));

    final textFinder = find.byKey(Key('error_message'));

    await tester.pumpWidget(_makeTestableWidget(PopularTvsPage()));

    expect(textFinder, findsOneWidget);
  });
}
