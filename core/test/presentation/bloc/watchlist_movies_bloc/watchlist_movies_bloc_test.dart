import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:core/domain/entities/movie.dart';
import 'package:core/domain/usecases/get_watchlist_movies.dart';
import 'package:core/presentation/bloc/watchlist_movies_bloc/watchlist_movies_bloc.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'watchlist_movies_bloc_test.mocks.dart';

@GenerateMocks([GetWatchlistMovies])
void main() {
  late WatchlistMoviesBloc popularMoviesBloc;
  late MockGetWatchlistMovies mockGetWatchlistMovies;

  setUp(() {
    mockGetWatchlistMovies = MockGetWatchlistMovies();
    popularMoviesBloc = WatchlistMoviesBloc(mockGetWatchlistMovies);
  });
  final tMovies = <Movie>[testMovie];

  blocTest<WatchlistMoviesBloc, WatchlistMoviesState>(
    'should emit [WatchlistMoviesLoading,WatchlistMoviesError] when fail',
    build: () {
      when(mockGetWatchlistMovies.execute())
          .thenAnswer((_) async => Left(ServerFailure('fail')));
      return popularMoviesBloc;
    },
    act: (bloc) => bloc.add(FetchWatchlistMoviesEvent()),
    expect: () => [
      WatchlistMoviesLoading(),
      WatchlistMoviesError('fail'),
    ],
    verify: (_) {
      verify(mockGetWatchlistMovies.execute());
    },
  );
  blocTest<WatchlistMoviesBloc, WatchlistMoviesState>(
    'should emit [WatchlistMoviesLoading,WatchlistMoviesLoaded] when success',
    build: () {
      when(mockGetWatchlistMovies.execute())
          .thenAnswer((_) async => Right(tMovies));
      return popularMoviesBloc;
    },
    act: (bloc) => bloc.add(FetchWatchlistMoviesEvent()),
    expect: () => [
      WatchlistMoviesLoading(),
      WatchlistMoviesLoaded(tMovies),
    ],
    verify: (_) {
      verify(mockGetWatchlistMovies.execute());
    },
  );
}
