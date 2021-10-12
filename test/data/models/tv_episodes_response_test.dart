import 'dart:convert';

import 'package:ditonton/data/models/tv_episode_model.dart';
import 'package:ditonton/data/models/tv_episodes_response.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../json_reader.dart';

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
  final tTvResponseModel =
      TvEpisodesResponse(episodes: <TvEpisodeModel>[tTvEpisodeModel]);
  group('fromJson', () {
    test('should return a valid model from JSON', () async {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(readJson('dummy_data/tv_episode.json'));
      // act
      final result = TvEpisodesResponse.fromJson(jsonMap);
      // assert
      expect(result, tTvResponseModel);
    });
  });
}
