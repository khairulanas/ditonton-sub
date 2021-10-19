import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:core/domain/entities/movie.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:movie/domain/usecases/get_popular_movies.dart';
import 'package:movie/presentation/bloc/popular_movies_bloc/popular_movies_bloc.dart';

import '../../../dummy_data/dummy_objects.dart';
import '../../provider/movie_list_notifier_test.mocks.dart';

@GenerateMocks([GetPopularMovies])
void main() {
  late PopularMoviesBloc popularMoviesBloc;
  late MockGetPopularMovies mockGetPopularMovies;

  setUp(() {
    mockGetPopularMovies = MockGetPopularMovies();
    popularMoviesBloc = PopularMoviesBloc(mockGetPopularMovies);
  });
  final tMovies = <Movie>[testMovie];

  blocTest<PopularMoviesBloc, PopularMoviesState>(
    'should emit [PopularMoviesLoading,PopularMoviesError] when fail',
    build: () {
      when(mockGetPopularMovies.execute())
          .thenAnswer((_) async => Left(ServerFailure('fail')));
      return popularMoviesBloc;
    },
    act: (bloc) => bloc.add(FetchPopularMoviesEvent()),
    expect: () => [
      PopularMoviesLoading(),
      PopularMoviesError('fail'),
    ],
    verify: (_) {
      verify(mockGetPopularMovies.execute());
    },
  );
  blocTest<PopularMoviesBloc, PopularMoviesState>(
    'should emit [PopularMoviesLoading,PopularMoviesLoaded] when success',
    build: () {
      when(mockGetPopularMovies.execute())
          .thenAnswer((_) async => Right(tMovies));
      return popularMoviesBloc;
    },
    act: (bloc) => bloc.add(FetchPopularMoviesEvent()),
    expect: () => [
      PopularMoviesLoading(),
      PopularMoviesLoaded(tMovies),
    ],
    verify: (_) {
      verify(mockGetPopularMovies.execute());
    },
  );
}
