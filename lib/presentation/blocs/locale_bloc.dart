import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_coding_challenge/presentation/states/locale_state.dart';

import '../../config/router/navigation_config.dart';
import '../events/locale_event.dart';

var localeBloc = navigationService.navigatorKey.currentContext?.read<LocaleBloc>();

LocaleModel? langModel = LocaleModel();

class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  LocaleBloc() : super(LocaleStateInit()) {
    on<LocaleChangeLangEvent>((event, emit) {
      emit(LocaleStateLoading());
      langModel?.currLang = _changeLanguage(langModel?.currLang.countryCode ?? 'id');
      emit(LocaleStateChangeLocale(locale: langModel?.currLang));
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
  Locale currLang = const Locale("Indonesia", 'id');
}
