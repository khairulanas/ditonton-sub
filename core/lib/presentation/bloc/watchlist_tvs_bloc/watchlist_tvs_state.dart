part of 'watchlist_tvs_bloc.dart';

abstract class WatchlistTvsState extends Equatable {
  const WatchlistTvsState();

  @override
  List<Object> get props => [];
}

class WatchlistTvsEmpty extends WatchlistTvsState {}

class WatchlistTvsLoading extends WatchlistTvsState {}

class WatchlistTvsError extends WatchlistTvsState {
  final String message;

  WatchlistTvsError(this.message);
  @override
  List<Object> get props => [message];
}

class WatchlistTvsLoaded extends WatchlistTvsState {
  final List<Tv> tvs;

  WatchlistTvsLoaded(this.tvs);
  @override
  List<Object> get props => [tvs];
}
