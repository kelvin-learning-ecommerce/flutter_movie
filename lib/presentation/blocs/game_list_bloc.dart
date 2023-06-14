import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_coding_challenge/presentation/states/game_list_state.dart';
import 'package:injectable/injectable.dart';

import '../../config/router/navigation_config.dart';
import '../../domain/models/response/game_list_response.dart';
import '../../domain/repositories/api_repository.dart';
import '../events/game_list_event.dart';

var gameListBloc = navigationService.navigatorKey.currentContext?.read<GameListBloc>();

@injectable
class GameListBloc extends Bloc<GameListEvent, GameListState> {
  final ApiRepository apiRepository;

  ListLayout listLayout = ListLayout.listview;
  List<GameListData> result = [];
  int page = 1;
  bool isLoading = false;

  GameListBloc(this.apiRepository) : super(GameListStateInit()) {
    on<GameListFetchEvent>((event, emit) async {
      if (!isLoading) {
        isLoading = true;

        if (event.isFirstPage) {
          emit(GameListStateLoading());
          result.clear();
        } else {
          emit(GameListStateLoadMore());
        }

        try {
          var response = await apiRepository.fetchGameList(page);

          result.addAll(response.results ?? []);

          emit(GameListStateSuccess(result: result, listLayout: listLayout));

          page += 1;
        } catch (e) {
          emit(GameListStateError(error: e.toString()));
        }

        isLoading = false;
      }
    });

    on<GameListChangeLayoutEvent>((event, emit) async {
      emit(GameListStateLoading());

      if (listLayout == ListLayout.listview) {
        listLayout = ListLayout.gridview;
      } else {
        listLayout = ListLayout.listview;
      }

      emit(GameListStateSuccess(result: result, listLayout: listLayout));

      emit(GameListStateLayoutType(layoutType: listLayout));
    });
  }
}
