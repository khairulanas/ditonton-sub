import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:core/domain/entities/tv.dart';
import 'package:core/domain/entities/tv_detail.dart';
import 'package:core/domain/usecases/get_watchlist_status_tv.dart';
import 'package:core/domain/usecases/remove_watchlist_tv.dart';
import 'package:core/domain/usecases/save_watchlist_tv.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tv_series/domain/usecases/get_tv_detail.dart';
import 'package:tv_series/domain/usecases/get_tv_recommendations.dart';

part 'tv_detail_event.dart';
part 'tv_detail_state.dart';
part 'tv_detail_bloc.freezed.dart';

class TvDetailBloc extends Bloc<TvDetailEvent, TvDetailState> {
  static const watchlistAddSuccessMessage = 'Added to Watchlist';
  static const watchlistRemoveSuccessMessage = 'Removed from Watchlist';

  final GetTvDetail getTvDetail;
  final GetTvRecommendations getTvRecommendations;
  final GetWatchListStatusTv getWatchListStatus;
  final SaveWatchlistTv saveWatchlistTv;
  final RemoveWatchlistTv removeWatchlistTv;
  TvDetailBloc({
    required this.getTvDetail,
    required this.getTvRecommendations,
    required this.getWatchListStatus,
    required this.saveWatchlistTv,
    required this.removeWatchlistTv,
  }) : super(TvDetailState.initial()) {
    on<TvDetailEvent>((event, emit) async {
      await event.map(
        fetchTvDetail: (v) async {
          emit(state.copyWith(
              tvState: RequestState.Loading, watchlistMessage: ''));

          final detailResult = await getTvDetail.execute(v.id);
          final recommendationResult = await getTvRecommendations.execute(v.id);
          await detailResult.fold(
            (failure) async => emit(state.copyWith(
                tvState: RequestState.Error, message: failure.message)),
            (tv) async {
              emit(state.copyWith(
                  tvState: RequestState.Loaded,
                  message: '',
                  recommendationState: RequestState.Loading,
                  tv: tv));

              recommendationResult.fold(
                (failure) {
                  emit(state.copyWith(
                    message: failure.message,
                    recommendationState: RequestState.Error,
                  ));
                },
                (tvs) {
                  emit(state.copyWith(
                    message: '',
                    tvRecommendations: tvs,
                    recommendationState: RequestState.Loaded,
                  ));
                },
              );
            },
          );
        },
        addWatchlist: (v) async {
          final result = await saveWatchlistTv.execute(v.tv);
          result.fold(
            (failure) {
              emit(state.copyWith(watchlistMessage: failure.message));
            },
            (successMessage) {
              emit(state.copyWith(watchlistMessage: successMessage));
            },
          );
          add(TvDetailEvent.loadWatchlistStatus(v.tv.id));
        },
        removeFromWatchlist: (v) async {
          final result = await removeWatchlistTv.execute(v.tv);

          result.fold(
            (failure) {
              emit(state.copyWith(watchlistMessage: failure.message));
            },
            (successMessage) {
              emit(state.copyWith(watchlistMessage: successMessage));
            },
          );

          add(TvDetailEvent.loadWatchlistStatus(v.tv.id));
        },
        loadWatchlistStatus: (v) async {
          final result = await getWatchListStatus.execute(v.id);
          emit(state.copyWith(isAddedToWatchlist: result));
        },
      );
    });
  }
}
