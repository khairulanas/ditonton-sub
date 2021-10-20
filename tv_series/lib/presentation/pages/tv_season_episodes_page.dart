import 'package:core/presentation/widgets/episode_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/presentation/bloc/tv_season_episode_bloc/tv_season_episode_bloc.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TvSeasonEpisodesPage extends StatefulWidget {
  static const ROUTE_NAME = '/TvSeasonEpisodesPage';
  final String seasonName;
  final int idTv;
  final int seasonNumber;

  const TvSeasonEpisodesPage(
      {Key? key,
      required this.idTv,
      required this.seasonNumber,
      required this.seasonName})
      : super(key: key);

  @override
  State<TvSeasonEpisodesPage> createState() => _TvSeasonEpisodesPageState();
}

class _TvSeasonEpisodesPageState extends State<TvSeasonEpisodesPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<TvSeasonEpisodeBloc>(context, listen: false).add(
            FetchTvSeasonEpisodeEvent(
                idTv: widget.idTv, seasonNumber: widget.seasonNumber)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        widget.seasonName,
      )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<TvSeasonEpisodeBloc, TvSeasonEpisodeState>(
          builder: (context, state) {
            if (state is TvSeasonEpisodeLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TvSeasonEpisodeLoaded) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final episode = state.tvEpisode[index];
                  return EpisodeCard(episode);
                },
                itemCount: state.tvEpisode.length,
              );
            } else {
              return Center(
                  key: Key('error_message'),
                  child: Text(
                      state is TvSeasonEpisodeError ? state.message : 'empty'));
            }
          },
        ),
      ),
    );
  }
}
