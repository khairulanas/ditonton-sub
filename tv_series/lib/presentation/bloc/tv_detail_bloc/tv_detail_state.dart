part of 'tv_detail_bloc.dart';

@freezed
class TvDetailState with _$TvDetailState {
  const factory TvDetailState(
      {required TvDetail? tv,
      required RequestState tvState,
      required List<Tv> tvRecommendations,
      required RequestState recommendationState,
      required String message,
      required String watchlistMessage,
      required bool isAddedToWatchlist}) = _TvDetailState;

  factory TvDetailState.initial() => TvDetailState(
      tvState: RequestState.Empty,
      recommendationState: RequestState.Empty,
      message: '',
      isAddedToWatchlist: false,
      tvRecommendations: [],
      tv: null,
      watchlistMessage: '');
}
