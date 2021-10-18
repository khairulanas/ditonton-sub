import 'package:core/core.dart';
import 'package:core/domain/entities/movie.dart';
import 'package:core/domain/entities/tv.dart';
import 'package:core/presentation/widgets/movie_card_list.dart';
import 'package:core/presentation/widgets/tv_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:search/presentation/bloc/search_bloc.dart';

class SearchPage extends StatelessWidget {
  static const ROUTE_NAME = '/search';
  final List<String> _title = ['Movies', 'Tv Show'];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Search'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                // onSubmitted: (query) {
                //   Provider.of<MovieSearchNotifier>(context, listen: false)
                //       .fetchMovieSearch(query);
                //   Provider.of<TvSearchNotifier>(context, listen: false)
                //       .fetchTvSearch(query);
                // },
                onChanged: (query) {
                  context.read<MovieSearchBloc>().add(OnQueryChanged(query));
                  context.read<TvSearchBloc>().add(OnQueryChanged(query));
                },
                decoration: InputDecoration(
                  hintText: 'Search title',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
                textInputAction: TextInputAction.search,
              ),
              SizedBox(height: 16),
              Text(
                'Search Result',
                style: kHeading6,
              ),
              TabBar(tabs: [
                Tab(
                  text: _title[0],
                ),
                Tab(
                  text: _title[1],
                ),
              ]),
              Flexible(
                child: TabBarView(
                  children: [
                    _MovieSearchResult(),
                    _TvSearchResult(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _MovieSearchResult extends StatelessWidget {
  const _MovieSearchResult({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieSearchBloc, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is SearchHasData<Movie>) {
          final result = state.result;
          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemBuilder: (context, index) {
              final movie = result[index];
              return MovieCard(movie);
            },
            itemCount: result.length,
          );
        } else {
          return Container();
        }
      },
    );
  }
}

class _TvSearchResult extends StatelessWidget {
  const _TvSearchResult({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvSearchBloc, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is SearchHasData<Tv>) {
          final result = state.result;
          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemBuilder: (context, index) {
              final tv = result[index];
              return TvCard(tv);
            },
            itemCount: result.length,
          );
        } else {
          return Container();
        }
      },
    );
  }
}
