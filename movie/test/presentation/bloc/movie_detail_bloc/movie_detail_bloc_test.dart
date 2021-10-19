import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:core/domain/entities/genre.dart';
import 'package:core/domain/entities/movie.dart';
import 'package:core/domain/entities/movie_detail.dart';
import 'package:core/domain/usecases/get_watchlist_status.dart';
import 'package:core/domain/usecases/remove_watchlist.dart';
import 'package:core/domain/usecases/save_watchlist.dart';
import 'package:core/utils/state_enum.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/domain/usecases/get_movie_detail.dart';
import 'package:movie/domain/usecases/get_movie_recommendations.dart';
import 'package:movie/presentation/bloc/movie_detail_bloc/movie_detail_bloc.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'movie_detail_bloc_test.mocks.dart';

@GenerateMocks([
  GetMovieDetail,
  GetMovieRecommendations,
  GetWatchListStatus,
  SaveWatchlist,
  RemoveWatchlist,
])
void main() {
  late MovieDetailBloc movieDetailBloc;
  late MockGetMovieDetail mockGetMovieDetail;
  late MockGetMovieRecommendations mockGetMovieRecommendations;
  late MockGetWatchListStatus mockGetWatchListStatus;
  late MockSaveWatchlist mockSaveWatchlist;
  late MockRemoveWatchlist mockRemoveWatchlist;
  setUp(() {
    mockGetMovieDetail = MockGetMovieDetail();
    mockGetMovieRecommendations = MockGetMovieRecommendations();
    mockGetWatchListStatus = MockGetWatchListStatus();
    mockSaveWatchlist = MockSaveWatchlist();
    mockRemoveWatchlist = MockRemoveWatchlist();
    movieDetailBloc = MovieDetailBloc(
        getMovieDetail: mockGetMovieDetail,
        getMovieRecommendations: mockGetMovieRecommendations,
        getWatchListStatus: mockGetWatchListStatus,
        saveWatchlist: mockSaveWatchlist,
        removeWatchlist: mockRemoveWatchlist);
  });
  final tMovieDetail = MovieDetail(
    adult: false,
    backdropPath: 'backdropPath',
    genres: [Genre(id: 1, name: 'Action')],
    id: 1,
    originalTitle: 'originalTitle',
    overview: 'overview',
    posterPath: 'posterPath',
    releaseDate: 'releaseDate',
    runtime: 120,
    title: 'title',
    voteAverage: 1,
    voteCount: 1,
  );
  final tMovies = <Movie>[testMovie];
  int tId = 1;
  final movieDetailState = MovieDetailState.initial();
  group('fetchMovieDetail event', () {
    blocTest<MovieDetailBloc, MovieDetailState>(
      'shoud emit [movieloading, movieloaded+recomendationLoading, recomendation loaded] when all success',
      build: () {
        when(mockGetMovieDetail.execute(tId))
            .thenAnswer((_) async => Right(tMovieDetail));
        when(mockGetMovieRecommendations.execute(tId))
            .thenAnswer((_) async => Right(tMovies));
        return movieDetailBloc;
      },
      act: (bloc) => bloc.add(MovieDetailEvent.fetchMovieDetail(tId)),
      expect: () => [
        movieDetailState.copyWith(movieState: RequestState.Loading),
        movieDetailState.copyWith(
          movieState: RequestState.Loaded,
          movie: tMovieDetail,
          message: '',
          recommendationState: RequestState.Loading,
        ),
        movieDetailState.copyWith(
          movieState: RequestState.Loaded,
          movie: tMovieDetail,
          message: '',
          recommendationState: RequestState.Loaded,
          movieRecommendations: tMovies,
        ),
      ],
      verify: (_) {
        verify(mockGetMovieDetail.execute(tId));
        verify(mockGetMovieRecommendations.execute(tId));
      },
    );

    blocTest<MovieDetailBloc, MovieDetailState>(
      'shoud emit [movieState:error+message:failure] when GetMovieDetail fail',
      build: () {
        when(mockGetMovieDetail.execute(tId))
            .thenAnswer((_) async => Left(ConnectionFailure('fail')));
        when(mockGetMovieRecommendations.execute(tId))
            .thenAnswer((_) async => Right(tMovies));
        return movieDetailBloc;
      },
      act: (bloc) => bloc.add(MovieDetailEvent.fetchMovieDetail(tId)),
      expect: () => [
        movieDetailState.copyWith(movieState: RequestState.Loading),
        movieDetailState.copyWith(
            movieState: RequestState.Error, message: 'fail'),
      ],
      verify: (_) {
        verify(mockGetMovieDetail.execute(tId));
        verify(mockGetMovieRecommendations.execute(tId));
      },
    );

    blocTest<MovieDetailBloc, MovieDetailState>(
      'shoud emit [movieloading, movieloaded+recomendationLoading, recomendation error+message] when GetMovieRecommendations fail',
      build: () {
        when(mockGetMovieDetail.execute(tId))
            .thenAnswer((_) async => Right(tMovieDetail));
        when(mockGetMovieRecommendations.execute(tId))
            .thenAnswer((_) async => Left(ConnectionFailure('fail')));
        return movieDetailBloc;
      },
      act: (bloc) => bloc.add(MovieDetailEvent.fetchMovieDetail(tId)),
      expect: () => [
        movieDetailState.copyWith(movieState: RequestState.Loading),
        movieDetailState.copyWith(
          movieState: RequestState.Loaded,
          movie: tMovieDetail,
          message: '',
          recommendationState: RequestState.Loading,
        ),
        movieDetailState.copyWith(
          movieState: RequestState.Loaded,
          movie: tMovieDetail,
          message: 'fail',
          recommendationState: RequestState.Error,
        ),
      ],
      verify: (_) {
        verify(mockGetMovieDetail.execute(tId));
        verify(mockGetMovieRecommendations.execute(tId));
      },
    );
  });

  group('addWatchlist event', () {
    blocTest<MovieDetailBloc, MovieDetailState>(
      'shoud emit [watchlistMessage,isAddedToWatchlist:true] when success',
      build: () {
        when(mockSaveWatchlist.execute(tMovieDetail))
            .thenAnswer((_) async => Right('Added to Watchlist'));
        when(mockGetWatchListStatus.execute(tMovieDetail.id))
            .thenAnswer((_) async => true);

        return movieDetailBloc;
      },
      act: (bloc) => bloc.add(MovieDetailEvent.addWatchlist(tMovieDetail)),
      expect: () => [
        movieDetailState.copyWith(watchlistMessage: 'Added to Watchlist'),
        movieDetailState.copyWith(
            watchlistMessage: 'Added to Watchlist', isAddedToWatchlist: true),
      ],
      verify: (_) {
        verify(mockSaveWatchlist.execute(tMovieDetail));
        verify(mockGetWatchListStatus.execute(tMovieDetail.id));
      },
    );
    blocTest<MovieDetailBloc, MovieDetailState>(
      'shoud emit [watchlistMessage] when fail',
      build: () {
        when(mockSaveWatchlist.execute(tMovieDetail))
            .thenAnswer((_) async => Left(DatabaseFailure('fail')));
        when(mockGetWatchListStatus.execute(tMovieDetail.id))
            .thenAnswer((_) async => false);

        return movieDetailBloc;
      },
      act: (bloc) => bloc.add(MovieDetailEvent.addWatchlist(tMovieDetail)),
      expect: () => [
        movieDetailState.copyWith(watchlistMessage: 'fail'),
      ],
      verify: (_) {
        verify(mockSaveWatchlist.execute(tMovieDetail));
        verify(mockGetWatchListStatus.execute(tMovieDetail.id));
      },
    );
  });

  group('removeFromWatchlist event', () {
    blocTest<MovieDetailBloc, MovieDetailState>(
      ': shoud emit [watchlistMessage, isAddedToWatchlist:false] when success',
      build: () {
        when(mockRemoveWatchlist.execute(tMovieDetail))
            .thenAnswer((_) async => Right('Removed from Watchlist'));
        when(mockGetWatchListStatus.execute(tMovieDetail.id))
            .thenAnswer((_) async => false);

        return movieDetailBloc;
      },
      act: (bloc) =>
          bloc.add(MovieDetailEvent.removeFromWatchlist(tMovieDetail)),
      expect: () => [
        movieDetailState.copyWith(watchlistMessage: 'Removed from Watchlist'),
      ],
      verify: (_) {
        verify(mockRemoveWatchlist.execute(tMovieDetail));
        verify(mockGetWatchListStatus.execute(tMovieDetail.id));
      },
    );
    blocTest<MovieDetailBloc, MovieDetailState>(
      ': shoud emit [watchlistMessage] when fail',
      build: () {
        when(mockRemoveWatchlist.execute(tMovieDetail))
            .thenAnswer((_) async => Left(DatabaseFailure('fail')));
        when(mockGetWatchListStatus.execute(tMovieDetail.id))
            .thenAnswer((_) async => false);

        return movieDetailBloc;
      },
      act: (bloc) =>
          bloc.add(MovieDetailEvent.removeFromWatchlist(tMovieDetail)),
      expect: () => [
        movieDetailState.copyWith(watchlistMessage: 'fail'),
      ],
      verify: (_) {
        verify(mockRemoveWatchlist.execute(tMovieDetail));
        verify(mockGetWatchListStatus.execute(tMovieDetail.id));
      },
    );
  });

  blocTest<MovieDetailBloc, MovieDetailState>(
    'loadWatchlistStatus event: shoud emit [isAddedToWatchlist:true]',
    build: () {
      when(mockGetWatchListStatus.execute(tId)).thenAnswer((_) async => false);

      return movieDetailBloc;
    },
    act: (bloc) => bloc.add(MovieDetailEvent.loadWatchlistStatus(tId)),
    expect: () => [
      movieDetailState.copyWith(isAddedToWatchlist: false),
    ],
    verify: (_) {
      verify(mockGetWatchListStatus.execute(tMovieDetail.id));
    },
  );
}
