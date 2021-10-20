import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:core/domain/entities/movie.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/domain/usecases/get_now_playing_movies.dart';

import 'package:movie/presentation/bloc/movie_list_bloc/movie_list_bloc.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'now_playing_movie_list_bloc_test.mocks.dart';

@GenerateMocks([GetNowPlayingMovies])
void main() {
  late NowPlayingMovieListBloc popularMovieListBloc;
  late MockGetNowPlayingMovies mockGetNowPlayingMovies;

  setUp(() {
    mockGetNowPlayingMovies = MockGetNowPlayingMovies();
    popularMovieListBloc = NowPlayingMovieListBloc(mockGetNowPlayingMovies);
  });
  final tMovies = <Movie>[testMovie];

  blocTest<NowPlayingMovieListBloc, MovieListState>(
    'should emit [NowPlayingMoviesLoading,NowPlayingMoviesError] when fail',
    build: () {
      when(mockGetNowPlayingMovies.execute())
          .thenAnswer((_) async => Left(ServerFailure('fail')));
      return popularMovieListBloc;
    },
    act: (bloc) => bloc.add(FetchMovieListEvent()),
    expect: () => [
      MovieListLoading(),
      MovieListError('fail'),
    ],
    verify: (_) {
      verify(mockGetNowPlayingMovies.execute());
    },
  );
  blocTest<NowPlayingMovieListBloc, MovieListState>(
    'should emit [NowPlayingMoviesLoading,NowPlayingMoviesLoaded] when success',
    build: () {
      when(mockGetNowPlayingMovies.execute())
          .thenAnswer((_) async => Right(tMovies));
      return popularMovieListBloc;
    },
    act: (bloc) => bloc.add(FetchMovieListEvent()),
    expect: () => [
      MovieListLoading(),
      MovieListLoaded(movies: tMovies),
    ],
    verify: (_) {
      verify(mockGetNowPlayingMovies.execute());
    },
  );
}
