import 'package:flutter_bloc/flutter_bloc.dart';

import '../module/list/bloc/game_list_bloc.dart';
import '../module/list/state/game_list_state.dart';

var providerList = [
  BlocProvider<GameListBloc>(create: (_) => GameListBloc(GameListStateInit())),
];