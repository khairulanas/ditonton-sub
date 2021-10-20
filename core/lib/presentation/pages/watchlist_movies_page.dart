import 'package:core/presentation/bloc/watchlist_movies_bloc/watchlist_movies_bloc.dart';
import 'package:core/presentation/bloc/watchlist_tvs_bloc/watchlist_tvs_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/movie_card_list.dart';
import '../widgets/tv_card_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WatchlistMoviesPage extends StatefulWidget {
  static const ROUTE_NAME = '/watchlist-movie';

  @override
  _WatchlistMoviesPageState createState() => _WatchlistMoviesPageState();
}

class _WatchlistMoviesPageState extends State<WatchlistMoviesPage> {
  final List<String> _title = ['Movies', 'Tv Show'];
  final List<Widget> _bodyScreen = [_WatchListMovieBody(), _WatchListTvBody()];

  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<WatchlistMoviesBloc>(context, listen: false)
            .add(FetchWatchlistMoviesEvent()));
    Future.microtask(() => Provider.of<WatchlistTvsBloc>(context, listen: false)
        .add(FetchWatchlistTvsEvent()));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Watchlist'),
          bottom: TabBar(
            tabs: [
              Tab(
                text: _title[0],
              ),
              Tab(
                text: _title[1],
              ),
            ],
          ),
        ),
        body: TabBarView(children: _bodyScreen),
      ),
    );
  }
}

class _WatchListMovieBody extends StatelessWidget {
  const _WatchListMovieBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<WatchlistMoviesBloc, WatchlistMoviesState>(
        builder: (context, state) {
          if (state is WatchlistMoviesLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WatchlistMoviesLoaded) {
            return ListView.builder(
              itemBuilder: (context, index) {
                final movie = state.movies[index];
                return MovieCard(movie);
              },
              itemCount: state.movies.length,
            );
          } else {
            return Center(
              key: Key('error_message'),
              child:
                  Text(state is WatchlistMoviesError ? state.message : 'empty'),
            );
          }
        },
      ),
    );
  }
}

class _WatchListTvBody extends StatelessWidget {
  const _WatchListTvBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<WatchlistTvsBloc, WatchlistTvsState>(
        builder: (context, state) {
          if (state is WatchlistTvsLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WatchlistTvsLoaded) {
            return ListView.builder(
              itemBuilder: (context, index) {
                final tv = state.tvs[index];
                return TvCard(tv);
              },
              itemCount: state.tvs.length,
            );
          } else {
            return Center(
              key: Key('error_message'),
              child: Text(state is WatchlistTvsError ? state.message : 'empty'),
            );
          }
        },
      ),
    );
  }
}
