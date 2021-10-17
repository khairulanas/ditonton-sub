import '../../utils/state_enum.dart';
import '../../domain/entities/tv_episode.dart';
import '../../domain/usecases/get_tv_season_episodes.dart';
import 'package:flutter/foundation.dart';

class TvSeasonEpisodesNotifier extends ChangeNotifier {
  final GetTvSeasonEpisodes getTvSeasonEpisodes;

  TvSeasonEpisodesNotifier({required this.getTvSeasonEpisodes});

  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  List<TvEpisode> _seasonEpisodes = [];
  List<TvEpisode> get seasonEpisodes => _seasonEpisodes;

  String _message = '';
  String get message => _message;

  Future<void> fetchTvSeasonEpisode(int idTv, int seasonNumber) async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await getTvSeasonEpisodes.execute(idTv, seasonNumber);
    result.fold(
      (failure) {
        _message = failure.message;
        _state = RequestState.Error;
        notifyListeners();
      },
      (data) {
        _seasonEpisodes = data;
        _state = RequestState.Loaded;
        notifyListeners();
      },
    );
  }
}
