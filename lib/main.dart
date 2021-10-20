import 'package:tv_series/presentation/bloc/tv_detail_bloc/tv_detail_bloc.dart';
import 'package:tv_series/presentation/bloc/tv_season_episode_bloc/tv_season_episode_bloc.dart';
import 'package:tv_series/presentation/pages/airing_today_tvs_page.dart';
import 'package:core/presentation/pages/home_page.dart';
import 'package:movie/presentation/bloc/movie_detail_bloc/movie_detail_bloc.dart';
import 'package:movie/presentation/bloc/movie_list_bloc/movie_list_bloc.dart';
import 'package:tv_series/presentation/bloc/tv_list_bloc/tv_list_bloc.dart';
import 'package:movie/presentation/bloc/top_rated_movies/top_rated_movies_bloc.dart';
import 'package:movie/presentation/pages/movie_detail_page.dart';
import 'package:movie/presentation/pages/popular_movies_page.dart';
import 'package:tv_series/presentation/pages/popular_tvs_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search/presentation/bloc/search_bloc.dart';
import 'package:search/presentation/pages/search_page.dart';
import 'package:movie/presentation/pages/top_rated_movies_page.dart';
import 'package:tv_series/presentation/pages/top_rated_tvs_page.dart';
import 'package:tv_series/presentation/pages/tv_detail_page.dart';
import 'package:tv_series/presentation/pages/tv_season_episodes_page.dart';
import 'package:core/presentation/pages/watchlist_movies_page.dart';
import 'package:movie/presentation/bloc/popular_movies_bloc/popular_movies_bloc.dart';
import 'package:core/presentation/provider/watchlist_movie_notifier.dart';
import 'package:core/presentation/provider/watchlist_tv_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ditonton/injection.dart' as di;
import 'package:about/about_page.dart';
import 'package:core/core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // movie

        BlocProvider(
          create: (_) => di.locator<NowPlayingMovieListBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<PopularMovieListBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TopRatedMovieListBloc>(),
        ),

        BlocProvider(
          create: (_) => di.locator<MovieDetailBloc>(),
        ),

        BlocProvider(
          create: (_) => di.locator<MovieSearchBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TvSearchBloc>(),
        ),

        BlocProvider(
          create: (_) => di.locator<TopRatedMoviesBloc>(),
        ),

        BlocProvider(
          create: (_) => di.locator<PopularMoviesBloc>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<WatchlistMovieNotifier>(),
        ),

        // tv series

        BlocProvider(
          create: (_) => di.locator<TopRatedTvListBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<PopularTvListBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<AiringTodayTvListBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TvDetailBloc>(),
        ),

        ChangeNotifierProvider(
          create: (_) => di.locator<WatchlistTvNotifier>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TvSeasonEpisodeBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          primaryColor: kRichBlack,
          scaffoldBackgroundColor: kRichBlack,
          textTheme: kTextTheme,
          colorScheme: kColorScheme.copyWith(secondary: kMikadoYellow),
        ),
        home: HomePage(),
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case '/home':
              return MaterialPageRoute(builder: (_) => HomePage());
            case PopularMoviesPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => PopularMoviesPage());
            case TopRatedMoviesPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => TopRatedMoviesPage());
            case MovieDetailPage.ROUTE_NAME:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => MovieDetailPage(id: id),
                settings: settings,
              );
            case SearchPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => SearchPage());
            case WatchlistMoviesPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => WatchlistMoviesPage());

            // tv
            case TvDetailPage.ROUTE_NAME:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => TvDetailPage(id: id),
                settings: settings,
              );
            case TvSeasonEpisodesPage.ROUTE_NAME:
              final arg = settings.arguments as Map<String, dynamic>;
              final idTv = arg['idTv'];
              final seasonNumber = arg['seasonNumber'];
              final seasonName = arg['seasonName'];
              return MaterialPageRoute(
                builder: (_) => TvSeasonEpisodesPage(
                    idTv: idTv,
                    seasonNumber: seasonNumber,
                    seasonName: seasonName),
                settings: settings,
              );
            case PopularTvsPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => PopularTvsPage());
            case TopRatedTvsPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => TopRatedTvsPage());
            case AiringTodayTvsPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => AiringTodayTvsPage());

            // etc
            case AboutPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => AboutPage());
            default:
              return MaterialPageRoute(builder: (_) {
                return Scaffold(
                  body: Center(
                    child: Text('Page not found :('),
                  ),
                );
              });
          }
        },
      ),
    );
  }
}
