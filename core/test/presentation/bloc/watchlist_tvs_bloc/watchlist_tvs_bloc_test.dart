import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:core/domain/entities/tv.dart';
import 'package:core/domain/usecases/get_watchlist_tvs.dart';
import 'package:core/presentation/bloc/watchlist_tvs_bloc/watchlist_tvs_bloc.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'watchlist_tvs_bloc_test.mocks.dart';

@GenerateMocks([GetWatchlistTvs])
void main() {
  late WatchlistTvsBloc popularTvsBloc;
  late MockGetWatchlistTvs mockGetWatchlistTvs;

  setUp(() {
    mockGetWatchlistTvs = MockGetWatchlistTvs();
    popularTvsBloc = WatchlistTvsBloc(mockGetWatchlistTvs);
  });
  final tTvs = <Tv>[testTv];

  blocTest<WatchlistTvsBloc, WatchlistTvsState>(
    'should emit [WatchlistTvsLoading,WatchlistTvsError] when fail',
    build: () {
      when(mockGetWatchlistTvs.execute())
          .thenAnswer((_) async => Left(ServerFailure('fail')));
      return popularTvsBloc;
    },
    act: (bloc) => bloc.add(FetchWatchlistTvsEvent()),
    expect: () => [
      WatchlistTvsLoading(),
      WatchlistTvsError('fail'),
    ],
    verify: (_) {
      verify(mockGetWatchlistTvs.execute());
    },
  );
  blocTest<WatchlistTvsBloc, WatchlistTvsState>(
    'should emit [WatchlistTvsLoading,WatchlistTvsLoaded] when success',
    build: () {
      when(mockGetWatchlistTvs.execute()).thenAnswer((_) async => Right(tTvs));
      return popularTvsBloc;
    },
    act: (bloc) => bloc.add(FetchWatchlistTvsEvent()),
    expect: () => [
      WatchlistTvsLoading(),
      WatchlistTvsLoaded(tTvs),
    ],
    verify: (_) {
      verify(mockGetWatchlistTvs.execute());
    },
  );
}
