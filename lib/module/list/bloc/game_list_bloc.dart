import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_coding_challenge/module/list/state/game_list_state.dart';
import 'package:flutter_coding_challenge/network/api_repository.dart';

import '../../../config/navigation_config.dart';
import '../event/game_list_event.dart';

var gameListBloc = navigationService.navigatorKey.currentContext?.read<GameListBloc>();

class GameListBloc extends Bloc<GameListEvent, GameListState> {
  GameListBloc(GameListState initState) : super(initState);
}
