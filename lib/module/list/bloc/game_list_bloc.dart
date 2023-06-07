import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_coding_challenge/module/list/state/game_list_state.dart';

import '../event/game_list_event.dart';

class GameListBloc extends Bloc<GameListEvent,GameListState>{
  GameListBloc(GameListState initialState) : super(initialState);

}