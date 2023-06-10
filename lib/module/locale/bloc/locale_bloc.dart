import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_coding_challenge/module/locale/state/locale_state.dart';

import '../../../config/navigation_config.dart';
import '../event/locale_event.dart';

var localeBloc = navigationService.navigatorKey.currentContext?.read<LocaleBloc>();

LocaleModel? langModel = LocaleModel();

class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  LocaleBloc(LocaleState initialState) : super(initialState) {
    on<LocaleChangeLangEvent>((event, emit) {
      emit(LocaleStateLoading());
      langModel?.currLang = _changeLanguage(langModel?.currLang.countryCode ?? 'id');
      emit(LocaleStateChangeLocale());
    });
  }

  Locale _changeLanguage(String countryCode) {
    Locale a;
    switch (countryCode) {
      case "id":
        a = const Locale("English", "en");
        break;
      default:
        a = const Locale("Indonesia", 'id');
    }
    return a;
  }
}

class LocaleModel {
  Locale currLang = const
// Locale("English", "en");
      Locale("Indonesia", 'id');
}
