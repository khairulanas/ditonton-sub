import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:core/domain/entities/tv.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:tv_series/domain/usecases/get_airing_today_tvs.dart';
import 'package:tv_series/presentation/bloc/tv_list_bloc/tv_list_bloc.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'airing_today_tv_list_bloc_test.mocks.dart';

@GenerateMocks([GetAiringTodayTvs])
void main() {
  late AiringTodayTvListBloc popularTvListBloc;
  late MockGetAiringTodayTvs mockGetAiringTodayTvs;

  setUp(() {
    mockGetAiringTodayTvs = MockGetAiringTodayTvs();
    popularTvListBloc = AiringTodayTvListBloc(mockGetAiringTodayTvs);
  });
  final tTvs = <Tv>[testTv];

  blocTest<AiringTodayTvListBloc, TvListState>(
    'should emit [AiringTodayTvsLoading,AiringTodayTvsError] when fail',
    build: () {
      when(mockGetAiringTodayTvs.execute())
          .thenAnswer((_) async => Left(ServerFailure('fail')));
      return popularTvListBloc;
    },
    act: (bloc) => bloc.add(FetchTvListEvent()),
    expect: () => [
      TvListLoading(),
      TvListError('fail'),
    ],
    verify: (_) {
      verify(mockGetAiringTodayTvs.execute());
    },
  );
  blocTest<AiringTodayTvListBloc, TvListState>(
    'should emit [AiringTodayTvsLoading,AiringTodayTvsLoaded] when success',
    build: () {
      when(mockGetAiringTodayTvs.execute())
          .thenAnswer((_) async => Right(tTvs));
      return popularTvListBloc;
    },
    act: (bloc) => bloc.add(FetchTvListEvent()),
    expect: () => [
      TvListLoading(),
      TvListLoaded(tvs: tTvs),
    ],
    verify: (_) {
      verify(mockGetAiringTodayTvs.execute());
    },
  );
}
