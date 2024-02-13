import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_coding_challenge/presentation/blocs/locale_bloc.dart';
import 'package:flutter_coding_challenge/presentation/states/locale_state.dart';

import '../../config/DI/di_locator.dart';
import '../../presentation/blocs/game_detail_bloc.dart';
import '../../presentation/blocs/game_list_bloc.dart';

var providerList = [
  BlocProvider<GameListBloc>(create: (_) => GameListBloc(locator())),
  BlocProvider<GameDetailBloc>(create: (_) => GameDetailBloc(locator())),
  BlocProvider<LocaleBloc>(create: (_) => LocaleBloc()),
];
