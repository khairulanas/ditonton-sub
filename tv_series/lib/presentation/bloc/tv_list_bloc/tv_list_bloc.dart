import 'package:core/domain/entities/tv.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/domain/usecases/get_airing_today_tvs.dart';
import 'package:tv_series/domain/usecases/get_popular_tvs.dart';
import 'package:tv_series/domain/usecases/get_top_rated_tvs.dart';
part 'tv_list_event.dart';
part 'tv_list_state.dart';
part 'airing_today_tv_list_bloc.dart';
part 'popular_tv_list_bloc.dart';

part 'top_rated_tv_list_bloc.dart';
