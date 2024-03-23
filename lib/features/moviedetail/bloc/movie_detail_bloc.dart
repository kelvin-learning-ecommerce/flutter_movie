import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../config/router/navigation_config.dart';
import '../events/movie_detail_event.dart';
import '../states/movie_detail_state.dart';

var movieDetailBloc = navigationService.navigatorKey.currentContext?.read<MovieDetailBloc>();

@injectable
class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  MovieDetailBloc() : super(MovieDetailStateInit()) {
    on<MovieDetailTabEvent>((event, emit) async {
      emit(MovieDetailStateInit());

      emit(MovieDetailStateTabChange(event.pos));
    });
  }
}
