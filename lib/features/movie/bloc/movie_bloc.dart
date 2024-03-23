import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:magnus_flutter_kelvin_prayitno/utils/enum/movie_fetch_enum.dart';

import '../../../config/router/navigation_config.dart';
import '../../../domain/models/response/movie_response.dart';
import '../../../domain/repositories/api_repository.dart';
import '../events/movie_event.dart';
import '../states/movie_state.dart';

var movieBloc = navigationService.navigatorKey.currentContext?.read<MovieBloc>();

@injectable
class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final ApiRepository apiRepository;

  ListLayout listLayout = ListLayout.listview;
  List<MovieResultResponse> result = [];

  MovieBloc(this.apiRepository) : super(MovieStateInit()) {
    on<MovieFetchEvent>((event, emit) async {
      var q = event.query ?? "";

      emit(MovieStateLoading());

      try {
        var response = await apiRepository.fetchMovie(q: q);

        if ((response.results ?? []).isEmpty) {
          emit(MovieStateError(error: MovieFetchError.noResult));
        } else {
          result.addAll(response.results ?? []);

          emit(MovieStateSuccess(result: result, listLayout: listLayout));
        }
      } catch (e) {
        emit(MovieStateError(error: MovieFetchError.other));
      }
    });

    on<MovieChangeLayoutEvent>((event, emit) async {
      emit(MovieStateLoading());

      if (listLayout == ListLayout.listview) {
        listLayout = ListLayout.gridview;
      } else {
        listLayout = ListLayout.listview;
      }

      emit(MovieStateSuccess(result: result, listLayout: listLayout));

      emit(MovieStateLayoutType(layoutType: listLayout));
    });
  }
}
