import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/DI/di_locator.dart';
import '../../features/locale/bloc/locale_bloc.dart';
import '../../features/movie/bloc/movie_bloc.dart';
import '../../features/newsdetail/bloc/movie_detail_bloc.dart';
import '../../features/splashscreen/bloc/splash_screen_bloc.dart';

var providerList = [
  BlocProvider<MovieBloc>(create: (_) => MovieBloc(locator())),
  BlocProvider<MovieDetailBloc>(create: (_) => MovieDetailBloc()),
  BlocProvider<LocaleBloc>(create: (_) => LocaleBloc()),
  BlocProvider<SplashScreenBloc>(create: (_) => SplashScreenBloc(locator(), locator())),
];
