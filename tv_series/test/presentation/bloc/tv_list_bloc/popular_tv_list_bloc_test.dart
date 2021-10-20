import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:core/domain/entities/tv.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:tv_series/domain/usecases/get_popular_tvs.dart';
import 'package:tv_series/presentation/bloc/tv_list_bloc/tv_list_bloc.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'popular_tv_list_bloc_test.mocks.dart';

@GenerateMocks([GetPopularTvs])
void main() {
  late PopularTvListBloc popularTvListBloc;
  late MockGetPopularTvs mockGetPopularTvs;

  setUp(() {
    mockGetPopularTvs = MockGetPopularTvs();
    popularTvListBloc = PopularTvListBloc(mockGetPopularTvs);
  });
  final tTvs = <Tv>[testTv];

  blocTest<PopularTvListBloc, TvListState>(
    'should emit [PopularTvsLoading,PopularTvsError] when fail',
    build: () {
      when(mockGetPopularTvs.execute())
          .thenAnswer((_) async => Left(ServerFailure('fail')));
      return popularTvListBloc;
    },
    act: (bloc) => bloc.add(FetchTvListEvent()),
    expect: () => [
      TvListLoading(),
      TvListError('fail'),
    ],
    verify: (_) {
      verify(mockGetPopularTvs.execute());
    },
  );
  blocTest<PopularTvListBloc, TvListState>(
    'should emit [PopularTvsLoading,PopularTvsLoaded] when success',
    build: () {
      when(mockGetPopularTvs.execute()).thenAnswer((_) async => Right(tTvs));
      return popularTvListBloc;
    },
    act: (bloc) => bloc.add(FetchTvListEvent()),
    expect: () => [
      TvListLoading(),
      TvListLoaded(tvs: tTvs),
    ],
    verify: (_) {
      verify(mockGetPopularTvs.execute());
    },
  );
}
