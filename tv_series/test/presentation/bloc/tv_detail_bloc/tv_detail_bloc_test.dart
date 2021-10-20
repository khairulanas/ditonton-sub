import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:core/domain/entities/genre.dart';
import 'package:core/domain/entities/tv.dart';
import 'package:core/domain/entities/tv_created_by.dart';
import 'package:core/domain/entities/tv_detail.dart';
import 'package:core/domain/entities/tv_last_episode_to_air.dart';
import 'package:core/domain/entities/tv_production_country.dart';
import 'package:core/domain/entities/tv_season.dart';
import 'package:core/domain/entities/tv_spoken_languange.dart';
import 'package:core/domain/usecases/get_watchlist_status.dart';
import 'package:core/domain/usecases/get_watchlist_status_tv.dart';
import 'package:core/domain/usecases/remove_watchlist.dart';
import 'package:core/domain/usecases/remove_watchlist_tv.dart';
import 'package:core/domain/usecases/save_watchlist.dart';
import 'package:core/domain/usecases/save_watchlist_tv.dart';
import 'package:core/utils/state_enum.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/domain/usecases/get_tv_detail.dart';
import 'package:tv_series/domain/usecases/get_tv_recommendations.dart';
import 'package:tv_series/presentation/bloc/tv_detail_bloc/tv_detail_bloc.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'tv_detail_bloc_test.mocks.dart';

@GenerateMocks([
  GetTvDetail,
  GetTvRecommendations,
  GetWatchListStatusTv,
  SaveWatchlistTv,
  RemoveWatchlistTv,
])
void main() {
  late TvDetailBloc tvDetailBloc;
  late MockGetTvDetail mockGetTvDetail;
  late MockGetTvRecommendations mockGetTvRecommendations;
  late MockGetWatchListStatusTv mockGetWatchListStatusTv;
  late MockSaveWatchlistTv mockSaveWatchlistTv;
  late MockRemoveWatchlistTv mockRemoveWatchlistTv;
  setUp(() {
    mockGetTvDetail = MockGetTvDetail();
    mockGetTvRecommendations = MockGetTvRecommendations();
    mockGetWatchListStatusTv = MockGetWatchListStatusTv();
    mockSaveWatchlistTv = MockSaveWatchlistTv();
    mockRemoveWatchlistTv = MockRemoveWatchlistTv();
    tvDetailBloc = TvDetailBloc(
        getTvDetail: mockGetTvDetail,
        getTvRecommendations: mockGetTvRecommendations,
        getWatchListStatus: mockGetWatchListStatusTv,
        saveWatchlistTv: mockSaveWatchlistTv,
        removeWatchlistTv: mockRemoveWatchlistTv);
  });
  final tTvDetail = TvDetail(
    backdropPath: 'backdropPath',
    createdBy: [
      CreatedBy(
          id: 1,
          creditId: 'creditId',
          name: 'name',
          gender: 1,
          profilePath: 'profilePath')
    ],
    episodeRunTime: [1, 2],
    firstAirDate: DateTime.parse("2012-02-27"),
    genres: [Genre(id: 1, name: 'Action')],
    homepage: 'homepage',
    id: 1,
    inProduction: true,
    languages: ['aa', 'bb'],
    lastAirDate: DateTime.parse("2012-02-27"),
    lastEpisodeToAir: TvLastEpisodeToAir(
        airDate: DateTime.parse("2012-02-27"),
        episodeNumber: 1,
        id: 1,
        name: 'name',
        overview: 'overview',
        productionCode: 'productionCode',
        seasonNumber: 1,
        stillPath: 'stillPath',
        voteAverage: 0,
        voteCount: 1),
    name: 'name',
    nextEpisodeToAir: 12,
    networks: [tvNetwork],
    numberOfEpisodes: 1,
    numberOfSeasons: 1,
    originCountry: ['aa'],
    originalLanguage: 'originalLanguage',
    originalName: 'originalName',
    overview: 'overview',
    popularity: 1.1,
    posterPath: 'posterPath',
    productionCompanies: [tvNetwork],
    productionCountries: [
      TvProductionCountry(iso31661: 'iso31661', name: 'name')
    ],
    seasons: [
      TvSeason(
        airDate: DateTime.parse("2012-02-27"),
        episodeCount: 1,
        id: 1,
        name: 'name',
        overview: 'overview',
        posterPath: 'posterPath',
        seasonNumber: 1,
      ),
    ],
    spokenLanguages: [
      TvSpokenLanguage(
          englishName: 'englishName', iso6391: 'iso6391', name: 'name')
    ],
    status: 'status',
    tagline: 'tagline',
    type: 'type',
    voteAverage: 1.1,
    voteCount: 1,
  );
  final tTvs = <Tv>[testTv];
  int tId = 1;
  final tvDetailState = TvDetailState.initial();
  group('fetchTvDetail event', () {
    blocTest<TvDetailBloc, TvDetailState>(
      'shoud emit [tvloading, tvloaded+recomendationLoading, recomendation loaded] when all success',
      build: () {
        when(mockGetTvDetail.execute(tId))
            .thenAnswer((_) async => Right(tTvDetail));
        when(mockGetTvRecommendations.execute(tId))
            .thenAnswer((_) async => Right(tTvs));
        return tvDetailBloc;
      },
      act: (bloc) => bloc.add(TvDetailEvent.fetchTvDetail(tId)),
      expect: () => [
        tvDetailState.copyWith(tvState: RequestState.Loading),
        tvDetailState.copyWith(
          tvState: RequestState.Loaded,
          tv: tTvDetail,
          message: '',
          recommendationState: RequestState.Loading,
        ),
        tvDetailState.copyWith(
          tvState: RequestState.Loaded,
          tv: tTvDetail,
          message: '',
          recommendationState: RequestState.Loaded,
          tvRecommendations: tTvs,
        ),
      ],
      verify: (_) {
        verify(mockGetTvDetail.execute(tId));
        verify(mockGetTvRecommendations.execute(tId));
      },
    );

    blocTest<TvDetailBloc, TvDetailState>(
      'shoud emit [tvState:error+message:failure] when GetTvDetail fail',
      build: () {
        when(mockGetTvDetail.execute(tId))
            .thenAnswer((_) async => Left(ConnectionFailure('fail')));
        when(mockGetTvRecommendations.execute(tId))
            .thenAnswer((_) async => Right(tTvs));
        return tvDetailBloc;
      },
      act: (bloc) => bloc.add(TvDetailEvent.fetchTvDetail(tId)),
      expect: () => [
        tvDetailState.copyWith(tvState: RequestState.Loading),
        tvDetailState.copyWith(tvState: RequestState.Error, message: 'fail'),
      ],
      verify: (_) {
        verify(mockGetTvDetail.execute(tId));
        verify(mockGetTvRecommendations.execute(tId));
      },
    );

    blocTest<TvDetailBloc, TvDetailState>(
      'shoud emit [tvloading, tvloaded+recomendationLoading, recomendation error+message] when GetTvRecommendations fail',
      build: () {
        when(mockGetTvDetail.execute(tId))
            .thenAnswer((_) async => Right(tTvDetail));
        when(mockGetTvRecommendations.execute(tId))
            .thenAnswer((_) async => Left(ConnectionFailure('fail')));
        return tvDetailBloc;
      },
      act: (bloc) => bloc.add(TvDetailEvent.fetchTvDetail(tId)),
      expect: () => [
        tvDetailState.copyWith(tvState: RequestState.Loading),
        tvDetailState.copyWith(
          tvState: RequestState.Loaded,
          tv: tTvDetail,
          message: '',
          recommendationState: RequestState.Loading,
        ),
        tvDetailState.copyWith(
          tvState: RequestState.Loaded,
          tv: tTvDetail,
          message: 'fail',
          recommendationState: RequestState.Error,
        ),
      ],
      verify: (_) {
        verify(mockGetTvDetail.execute(tId));
        verify(mockGetTvRecommendations.execute(tId));
      },
    );
  });

  group('addWatchlist event', () {
    blocTest<TvDetailBloc, TvDetailState>(
      'shoud emit [watchlistMessage,isAddedToWatchlist:true] when success',
      build: () {
        when(mockSaveWatchlistTv.execute(tTvDetail))
            .thenAnswer((_) async => Right('Added to Watchlist'));
        when(mockGetWatchListStatusTv.execute(tTvDetail.id))
            .thenAnswer((_) async => true);

        return tvDetailBloc;
      },
      act: (bloc) => bloc.add(TvDetailEvent.addWatchlist(tTvDetail)),
      expect: () => [
        tvDetailState.copyWith(watchlistMessage: 'Added to Watchlist'),
        tvDetailState.copyWith(
            watchlistMessage: 'Added to Watchlist', isAddedToWatchlist: true),
      ],
      verify: (_) {
        verify(mockSaveWatchlistTv.execute(tTvDetail));
        verify(mockGetWatchListStatusTv.execute(tTvDetail.id));
      },
    );
    blocTest<TvDetailBloc, TvDetailState>(
      'shoud emit [watchlistMessage] when fail',
      build: () {
        when(mockSaveWatchlistTv.execute(tTvDetail))
            .thenAnswer((_) async => Left(DatabaseFailure('fail')));
        when(mockGetWatchListStatusTv.execute(tTvDetail.id))
            .thenAnswer((_) async => false);

        return tvDetailBloc;
      },
      act: (bloc) => bloc.add(TvDetailEvent.addWatchlist(tTvDetail)),
      expect: () => [
        tvDetailState.copyWith(watchlistMessage: 'fail'),
      ],
      verify: (_) {
        verify(mockSaveWatchlistTv.execute(tTvDetail));
        verify(mockGetWatchListStatusTv.execute(tTvDetail.id));
      },
    );
  });

  group('removeFromWatchlist event', () {
    blocTest<TvDetailBloc, TvDetailState>(
      ': shoud emit [watchlistMessage, isAddedToWatchlist:false] when success',
      build: () {
        when(mockRemoveWatchlistTv.execute(tTvDetail))
            .thenAnswer((_) async => Right('Removed from Watchlist'));
        when(mockGetWatchListStatusTv.execute(tTvDetail.id))
            .thenAnswer((_) async => false);

        return tvDetailBloc;
      },
      act: (bloc) => bloc.add(TvDetailEvent.removeFromWatchlist(tTvDetail)),
      expect: () => [
        tvDetailState.copyWith(watchlistMessage: 'Removed from Watchlist'),
      ],
      verify: (_) {
        verify(mockRemoveWatchlistTv.execute(tTvDetail));
        verify(mockGetWatchListStatusTv.execute(tTvDetail.id));
      },
    );
    blocTest<TvDetailBloc, TvDetailState>(
      ': shoud emit [watchlistMessage] when fail',
      build: () {
        when(mockRemoveWatchlistTv.execute(tTvDetail))
            .thenAnswer((_) async => Left(DatabaseFailure('fail')));
        when(mockGetWatchListStatusTv.execute(tTvDetail.id))
            .thenAnswer((_) async => false);

        return tvDetailBloc;
      },
      act: (bloc) => bloc.add(TvDetailEvent.removeFromWatchlist(tTvDetail)),
      expect: () => [
        tvDetailState.copyWith(watchlistMessage: 'fail'),
      ],
      verify: (_) {
        verify(mockRemoveWatchlistTv.execute(tTvDetail));
        verify(mockGetWatchListStatusTv.execute(tTvDetail.id));
      },
    );
  });

  blocTest<TvDetailBloc, TvDetailState>(
    'loadWatchlistStatus event: shoud emit [isAddedToWatchlist:true]',
    build: () {
      when(mockGetWatchListStatusTv.execute(tId))
          .thenAnswer((_) async => false);

      return tvDetailBloc;
    },
    act: (bloc) => bloc.add(TvDetailEvent.loadWatchlistStatus(tId)),
    expect: () => [
      tvDetailState.copyWith(isAddedToWatchlist: false),
    ],
    verify: (_) {
      verify(mockGetWatchListStatusTv.execute(tTvDetail.id));
    },
  );
}
