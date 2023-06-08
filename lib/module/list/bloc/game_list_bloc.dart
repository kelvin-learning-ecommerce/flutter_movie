import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_coding_challenge/module/list/state/game_list_state.dart';
import 'package:injectable/injectable.dart';

import '../../../config/navigation_config.dart';
import '../../../network/api_repository.dart';
import '../event/game_list_event.dart';
import '../model/game_list_model.dart';

var gameListBloc = navigationService.navigatorKey.currentContext?.read<GameListBloc>();

@injectable
class GameListBloc extends Bloc<GameListEvent, GameListState> {
  final ApiRepository apiRepository;

  ListLayout listLayout = ListLayout.listview;
  List<GameListData> result = [];

  GameListBloc(this.apiRepository) : super(GameListStateInit()) {
    on<GameListFetchEvent>((event, emit) async {
      emit(GameListStateLoading());

      try {
        var response = await apiRepository.fetchGameList();

        result.clear();

        result.addAll(response.result);

        emit(GameListStateSuccess(result: result, listLayout: listLayout));
      } catch (e) {
        emit(GameListStateError(error: e.toString()));
      }
    });

    on<GameListChangeLangEvent>((event, emit) async {
      emit(GameListStateChangeLang());
    });

    on<GameListChangeLayoutEvent>((event, emit) async {
      emit(GameListStateLoading());

      if (listLayout == ListLayout.listview) {
        listLayout = ListLayout.gridview;
      } else {
        listLayout = ListLayout.listview;
      }

      emit(GameListStateSuccess(result: result, listLayout: event.listLayout));
    });
  }
}
