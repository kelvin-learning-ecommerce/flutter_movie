import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/news/bloc/news_bloc.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/newsdetail/bloc/news_detail_bloc.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/register/bloc/register_bloc.dart';

import '../../config/DI/di_locator.dart';
import '../../modules/locale/bloc/locale_bloc.dart';
import '../../modules/login/bloc/login_bloc.dart';
import '../../modules/profile/bloc/profile_bloc.dart';
import '../../modules/splashscreen/bloc/splash_screen_bloc.dart';

var providerList = [
  BlocProvider<LoginBloc>(create: (_) => LoginBloc(locator(), locator())),
  BlocProvider<NewsBloc>(create: (_) => NewsBloc(locator())),
  BlocProvider<NewsDetailBloc>(create: (_) => NewsDetailBloc()),
  BlocProvider<LocaleBloc>(create: (_) => LocaleBloc()),
  BlocProvider<SplashScreenBloc>(create: (_) => SplashScreenBloc(locator(), locator())),
  BlocProvider<RegisterBloc>(create: (_) => RegisterBloc(locator())),
  BlocProvider<ProfileBloc>(create: (_) => ProfileBloc(locator(), locator())),
];
