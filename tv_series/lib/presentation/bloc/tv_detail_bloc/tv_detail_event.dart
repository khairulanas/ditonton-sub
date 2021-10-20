part of 'tv_detail_bloc.dart';

@freezed
class TvDetailEvent with _$TvDetailEvent {
  const factory TvDetailEvent.fetchTvDetail(int id) = FetchTvDetail;
  const factory TvDetailEvent.addWatchlist(TvDetail tv) = AddWatchlist;
  const factory TvDetailEvent.removeFromWatchlist(TvDetail tv) =
      RemoveFromWatchlist;
  const factory TvDetailEvent.loadWatchlistStatus(int id) = LoadWatchlistStatus;
}
