import 'package:core/presentation/widgets/tv_card_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/presentation/bloc/tv_list_bloc/tv_list_bloc.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AiringTodayTvsPage extends StatefulWidget {
  static const ROUTE_NAME = '/airing-today-tv';

  @override
  _AiringTodayTvsPageState createState() => _AiringTodayTvsPageState();
}

class _AiringTodayTvsPageState extends State<AiringTodayTvsPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<AiringTodayTvListBloc>(context, listen: false)
            .add(FetchTvListEvent()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Airing Today Tv Show'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<AiringTodayTvListBloc, TvListState>(
          builder: (context, state) {
            if (state is TvListLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TvListLoaded) {
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
                child: Text(state is TvListError ? state.message : 'empty'),
              );
            }
          },
        ),
      ),
    );
  }
}
