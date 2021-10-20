import 'package:core/core.dart';
import 'package:core/domain/entities/tv.dart';

import '../../domain/usecases/get_airing_today_tvs.dart';
import 'package:flutter/foundation.dart';

class AiringTodayTvsNotifier extends ChangeNotifier {
  final GetAiringTodayTvs getAiringTodayTvs;

  AiringTodayTvsNotifier(this.getAiringTodayTvs);

  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  List<Tv> _tvs = [];
  List<Tv> get tvs => _tvs;

  String _message = '';
  String get message => _message;

  Future<void> fetchAiringTodayTvs() async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await getAiringTodayTvs.execute();

    result.fold(
      (failure) {
        _message = failure.message;
        _state = RequestState.Error;
        notifyListeners();
      },
      (tvsData) {
        _tvs = tvsData;
        _state = RequestState.Loaded;
        notifyListeners();
      },
    );
  }
}
