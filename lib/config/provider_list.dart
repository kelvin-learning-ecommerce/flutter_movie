import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_coding_challenge/DI/di_locator.dart';
import 'package:flutter_coding_challenge/module/detail/bloc/game_detail_bloc.dart';
import 'package:flutter_coding_challenge/module/locale/bloc/locale_bloc.dart';
import 'package:flutter_coding_challenge/module/locale/state/locale_state.dart';

import '../module/list/bloc/game_list_bloc.dart';

var providerList = [
  BlocProvider<GameListBloc>(create: (_) => GameListBloc(locator())),
  BlocProvider<GameDetailBloc>(create: (_) => GameDetailBloc(locator())),
  BlocProvider<LocaleBloc>(create: (_) => LocaleBloc(LocaleStateInit())),
];
