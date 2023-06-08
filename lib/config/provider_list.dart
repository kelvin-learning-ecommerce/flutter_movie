import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_coding_challenge/DI/di_locator.dart';

import '../module/list/bloc/game_list_bloc.dart';

var providerList = [
  BlocProvider<GameListBloc>(create: (_) => GameListBloc(locator())),
];
