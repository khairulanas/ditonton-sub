import 'package:flutter/material.dart';
import 'package:movie/presentation/bloc/movie_list_bloc/movie_list_bloc.dart';
import 'package:tv_series/presentation/bloc/tv_list_bloc/tv_list_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tv_series/presentation/pages/home_tv_screen.dart';

import '../../utils/routes.dart';

import 'package:movie/presentation/pages/home_movie_screen.dart';
import 'watchlist_movies_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _title = ['Movies', 'Tv Show'];
  int _index = 0;
  final List<Widget> _bodyScreen = [HomeMovieScreen(), HomeTvScreen()];
  void _onSelectedCategory(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<NowPlayingMovieListBloc>(context, listen: false)
          .add(FetchMovieListEvent());
      Provider.of<PopularMovieListBloc>(context, listen: false)
          .add(FetchMovieListEvent());
      Provider.of<TopRatedMovieListBloc>(context, listen: false)
          .add(FetchMovieListEvent());
    });
    Future.microtask(() {
      Provider.of<AiringTodayTvListBloc>(context, listen: false)
          .add(FetchTvListEvent());
      Provider.of<PopularTvListBloc>(context, listen: false)
          .add(FetchTvListEvent());
      Provider.of<TopRatedTvListBloc>(context, listen: false)
          .add(FetchTvListEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/circle-g.png'),
              ),
              accountName: Text('Ditonton'),
              accountEmail: Text('ditonton@dicoding.com'),
            ),
            ListTile(
              leading: Icon(Icons.movie),
              title: Text(_title[0]),
              onTap: () {
                _onSelectedCategory(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.movie),
              title: Text(_title[1]),
              onTap: () {
                _onSelectedCategory(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.save_alt),
              title: Text('Watchlist'),
              onTap: () {
                Navigator.pushNamed(context, WatchlistMoviesPage.ROUTE_NAME);
              },
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, ABOUT_ROUTE);
              },
              leading: Icon(Icons.info_outline),
              title: Text('About'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Ditonton - ${_title[_index]}'),
        actions: [
          IconButton(
            onPressed: () {
              // FirebaseCrashlytics.instance.crash();
              Navigator.pushNamed(context, SEARCH_ROUTE);
            },
            icon: Icon(Icons.search),
          )
        ],
      ),
      body: _bodyScreen[_index],
    );
  }
}
