import 'package:ditonton/data/models/movie_model.dart';
import 'package:ditonton/data/models/tv_model.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final tTvModel = TvModel(
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
      voteCount: 1796);

  final tTv = Tv(
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
      voteCount: 1796);

  test('should be a subclass of Tv entity', () async {
    final result = tTvModel.toEntity();
    expect(result, tTv);
  });
}
