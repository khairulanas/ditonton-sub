import '../../utils/state_enum.dart';
import '../provider/tv_season_episodes_notifier.dart';
import '../widgets/episode_card.dart';
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
        Provider.of<TvSeasonEpisodesNotifier>(context, listen: false)
            .fetchTvSeasonEpisode(widget.idTv, widget.seasonNumber));
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
        child: Consumer<TvSeasonEpisodesNotifier>(
          builder: (context, data, child) {
            if (data.state == RequestState.Loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (data.state == RequestState.Loaded) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final episode = data.seasonEpisodes[index];
                  return EpisodeCard(episode);
                },
                itemCount: data.seasonEpisodes.length,
              );
            } else {
              return Center(
                key: Key('error_message'),
                child: Text(data.message),
              );
            }
          },
        ),
      ),
    );
  }
}
