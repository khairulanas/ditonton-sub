import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/domain/usecases/search_tvs.dart';
import 'package:ditonton/presentation/provider/tv_search_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'tv_search_notifier_test.mocks.dart';

@GenerateMocks([SearchTvs])
void main() {
  late TvSearchNotifier provider;
  late MockSearchTvs mockSearchTvs;
  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;
    mockSearchTvs = MockSearchTvs();
    provider = TvSearchNotifier(searchTvs: mockSearchTvs)
      ..addListener(() {
        listenerCallCount += 1;
      });
  });

  final tTvModel = Tv(
    backdropPath: "/3XlKckxPEa4lg5w4vHnyE35PUyI.jpg",
    firstAirDate: DateTime.parse("2017-04-05"),
    genreIds: [10759, 16],
    id: 70881,
    name: "Boruto: Naruto Next Generations",
    originCountry: ["JP"],
    originalLanguage: "ja",
    originalName: "BORUTO-ボルト- NARUTO NEXT GENERATONS",
    overview:
        "The Hidden Leaf Village has entered an era of peace and modernity. Tall buildings line the streets, giant screens flash with images, and the Thunder Rail runs through the village, connecting each district together. Though it's still a ninja village, the number of civilians has increased and the life of the shinobi is beginning to change. Boruto Uzumaki, son of Seventh Hokage Naruto Uzumaki, has enrolled in the Ninja Academy to learn the ways of the ninja. The other students are ready to dismiss him as \"just the son of the Hokage,” but Boruto’s heart and character blow all their assumptions away. As a series of mysterious events begins to unfold, it’s up to Boruto and his new friends to handle them. Like a gale-force wind, Boruto makes his own way into everyone's hearts; his story is about to begin!!",
    popularity: 61.339,
    posterPath: "/e0B6i48kxdRkMcK4tR4YNfXGWOc.jpg",
    voteAverage: 8.0,
    voteCount: 1796,
  );
  final tTvList = <Tv>[tTvModel];
  final tQuery = 'naruto';

  group('search tvs', () {
    test('should change state to loading when usecase is called', () async {
      // arrange
      when(mockSearchTvs.execute(tQuery))
          .thenAnswer((_) async => Right(tTvList));
      // act
      provider.fetchTvSearch(tQuery);
      // assert
      expect(provider.state, RequestState.Loading);
    });

    test('should change search result data when data is gotten successfully',
        () async {
      // arrange
      when(mockSearchTvs.execute(tQuery))
          .thenAnswer((_) async => Right(tTvList));
      // act
      await provider.fetchTvSearch(tQuery);
      // assert
      expect(provider.state, RequestState.Loaded);
      expect(provider.searchResult, tTvList);
      expect(listenerCallCount, 2);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockSearchTvs.execute(tQuery))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      // act
      await provider.fetchTvSearch(tQuery);
      // assert
      expect(provider.state, RequestState.Error);
      expect(provider.message, 'Server Failure');
      expect(listenerCallCount, 2);
    });
  });
}
