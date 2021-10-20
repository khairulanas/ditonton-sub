import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:core/domain/entities/movie.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:movie/domain/usecases/get_top_rated_movies.dart';
import 'package:movie/presentation/bloc/movie_list_bloc/movie_list_bloc.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'top_rated_movie_list_bloc_test.mocks.dart';

@GenerateMocks([GetTopRatedMovies])
void main() {
  late TopRatedMovieListBloc popularMovieListBloc;
  late MockGetTopRatedMovies mockGetTopRatedMovies;

  setUp(() {
    mockGetTopRatedMovies = MockGetTopRatedMovies();
    popularMovieListBloc = TopRatedMovieListBloc(mockGetTopRatedMovies);
  });
  final tMovies = <Movie>[testMovie];

  blocTest<TopRatedMovieListBloc, MovieListState>(
    'should emit [TopRatedMoviesLoading,TopRatedMoviesError] when fail',
    build: () {
      when(mockGetTopRatedMovies.execute())
          .thenAnswer((_) async => Left(ServerFailure('fail')));
      return popularMovieListBloc;
    },
    act: (bloc) => bloc.add(FetchMovieListEvent()),
    expect: () => [
      MovieListLoading(),
      MovieListError('fail'),
    ],
    verify: (_) {
      verify(mockGetTopRatedMovies.execute());
    },
  );
  blocTest<TopRatedMovieListBloc, MovieListState>(
    'should emit [TopRatedMoviesLoading,TopRatedMoviesLoaded] when success',
    build: () {
      when(mockGetTopRatedMovies.execute())
          .thenAnswer((_) async => Right(tMovies));
      return popularMovieListBloc;
    },
    act: (bloc) => bloc.add(FetchMovieListEvent()),
    expect: () => [
      MovieListLoading(),
      MovieListLoaded(movies: tMovies),
    ],
    verify: (_) {
      verify(mockGetTopRatedMovies.execute());
    },
  );
}
