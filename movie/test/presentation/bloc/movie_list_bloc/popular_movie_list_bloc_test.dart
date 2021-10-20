import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:core/domain/entities/movie.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:movie/domain/usecases/get_popular_movies.dart';
import 'package:movie/presentation/bloc/movie_list_bloc/movie_list_bloc.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'popular_movie_list_bloc_test.mocks.dart';

@GenerateMocks([GetPopularMovies])
void main() {
  late PopularMovieListBloc popularMovieListBloc;
  late MockGetPopularMovies mockGetPopularMovies;

  setUp(() {
    mockGetPopularMovies = MockGetPopularMovies();
    popularMovieListBloc = PopularMovieListBloc(mockGetPopularMovies);
  });
  final tMovies = <Movie>[testMovie];

  blocTest<PopularMovieListBloc, MovieListState>(
    'should emit [PopularMoviesLoading,PopularMoviesError] when fail',
    build: () {
      when(mockGetPopularMovies.execute())
          .thenAnswer((_) async => Left(ServerFailure('fail')));
      return popularMovieListBloc;
    },
    act: (bloc) => bloc.add(FetchMovieListEvent()),
    expect: () => [
      MovieListLoading(),
      MovieListError('fail'),
    ],
    verify: (_) {
      verify(mockGetPopularMovies.execute());
    },
  );
  blocTest<PopularMovieListBloc, MovieListState>(
    'should emit [PopularMoviesLoading,PopularMoviesLoaded] when success',
    build: () {
      when(mockGetPopularMovies.execute())
          .thenAnswer((_) async => Right(tMovies));
      return popularMovieListBloc;
    },
    act: (bloc) => bloc.add(FetchMovieListEvent()),
    expect: () => [
      MovieListLoading(),
      MovieListLoaded(movies: tMovies),
    ],
    verify: (_) {
      verify(mockGetPopularMovies.execute());
    },
  );
}
