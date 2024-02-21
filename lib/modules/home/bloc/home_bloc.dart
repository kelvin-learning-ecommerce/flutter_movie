import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/router/navigation_config.dart';
import '../events/home_event.dart';
import '../states/home_state.dart';

var homeBloc = navigationService.navigatorKey.currentContext?.read<HomeBloc>();

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeStateInit()) {
    // on<LocaleChangeLangEvent>((event, emit) {
    //   emit(LocaleStateLoading());
    //   langModel?.currLang = _changeLanguage(langModel?.currLang.countryCode ?? 'id');
    //   emit(LocaleStateChangeLocale(locale: langModel?.currLang));
    // });
  }
}
