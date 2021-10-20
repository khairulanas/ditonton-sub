import 'package:core/domain/entities/movie.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/domain/usecases/get_now_playing_movies.dart';
import 'package:movie/domain/usecases/get_popular_movies.dart';
import 'package:movie/domain/usecases/get_top_rated_movies.dart';
part 'movie_list_event.dart';
part 'movie_list_state.dart';
part 'now_playing_movie_list_bloc.dart';
part 'popular_movie_list_bloc.dart';

part 'top_rated_movie_list_bloc.dart';
