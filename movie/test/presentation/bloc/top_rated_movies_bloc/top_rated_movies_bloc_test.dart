import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:core/domain/entities/movie.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:movie/domain/usecases/get_top_rated_movies.dart';
import 'package:movie/presentation/bloc/top_rated_movies/top_rated_movies_bloc.dart';

import '../../../dummy_data/dummy_objects.dart';
import '../../provider/movie_list_notifier_test.mocks.dart';

@GenerateMocks([GetTopRatedMovies])
void main() {
  late TopRatedMoviesBloc popularMoviesBloc;
  late MockGetTopRatedMovies mockGetTopRatedMovies;

  setUp(() {
    mockGetTopRatedMovies = MockGetTopRatedMovies();
    popularMoviesBloc = TopRatedMoviesBloc(mockGetTopRatedMovies);
  });
  final tMovies = <Movie>[testMovie];

  blocTest<TopRatedMoviesBloc, TopRatedMoviesState>(
    'should emit [TopRatedMoviesLoading,TopRatedMoviesError] when fail',
    build: () {
      when(mockGetTopRatedMovies.execute())
          .thenAnswer((_) async => Left(ServerFailure('fail')));
      return popularMoviesBloc;
    },
    act: (bloc) => bloc.add(FetchTopRatedMoviesEvent()),
    expect: () => [
      TopRatedMoviesLoading(),
      TopRatedMoviesError('fail'),
    ],
    verify: (_) {
      verify(mockGetTopRatedMovies.execute());
    },
  );
  blocTest<TopRatedMoviesBloc, TopRatedMoviesState>(
    'should emit [TopRatedMoviesLoading,TopRatedMoviesLoaded] when success',
    build: () {
      when(mockGetTopRatedMovies.execute())
          .thenAnswer((_) async => Right(tMovies));
      return popularMoviesBloc;
    },
    act: (bloc) => bloc.add(FetchTopRatedMoviesEvent()),
    expect: () => [
      TopRatedMoviesLoading(),
      TopRatedMoviesLoaded(tMovies),
    ],
    verify: (_) {
      verify(mockGetTopRatedMovies.execute());
    },
  );
}
