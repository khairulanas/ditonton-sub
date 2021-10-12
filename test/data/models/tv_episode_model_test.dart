import 'package:ditonton/data/models/tv_episode_model.dart';
import 'package:ditonton/domain/entities/tv_episode.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final tTvEpisodeModel = TvEpisodeModel(
      airDate: DateTime.parse("2021-02-12"),
      episodeNumber: 1,
      id: 2723622,
      name: "Episode 5.5: Guidepost",
      overview:
          "A special episode detailing the events leading up to the current situation with the Grace Field Farm children.",
      productionCode: "",
      seasonNumber: 0,
      stillPath: "/aHqMdHgzOTGLFYCZxXrUyywq67l.jpg",
      voteAverage: 0.0,
      voteCount: 0);
  final tTvEpisode = TvEpisode(
      airDate: DateTime.parse("2021-02-12"),
      episodeNumber: 1,
      id: 2723622,
      name: "Episode 5.5: Guidepost",
      overview:
          "A special episode detailing the events leading up to the current situation with the Grace Field Farm children.",
      productionCode: "",
      seasonNumber: 0,
      stillPath: "/aHqMdHgzOTGLFYCZxXrUyywq67l.jpg",
      voteAverage: 0.0,
      voteCount: 0);

  test('should be a subclass of Tv episode entity', () async {
    final result = tTvEpisodeModel.toEntity();
    expect(result, tTvEpisode);
  });
}
