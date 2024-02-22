// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Login`
  String get login_title {
    return Intl.message(
      'Login',
      name: 'login_title',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register_label {
    return Intl.message(
      'Register',
      name: 'register_label',
      desc: '',
      args: [],
    );
  }

  /// `News`
  String get news_title {
    return Intl.message(
      'News',
      name: 'news_title',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home_title {
    return Intl.message(
      'Home',
      name: 'home_title',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile_tab_title {
    return Intl.message(
      'Profile',
      name: 'profile_tab_title',
      desc: '',
      args: [],
    );
  }

  /// `Image Not Available`
  String get image_unavailable {
    return Intl.message(
      'Image Not Available',
      name: 'image_unavailable',
      desc: '',
      args: [],
    );
  }

  /// `Game data Not Available`
  String get game_detail_unavailable {
    return Intl.message(
      'Game data Not Available',
      name: 'game_detail_unavailable',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get username_label {
    return Intl.message(
      'Username',
      name: 'username_label',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password_label {
    return Intl.message(
      'Password',
      name: 'password_label',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name_label {
    return Intl.message(
      'Name',
      name: 'name_label',
      desc: '',
      args: [],
    );
  }

  /// `Phone No`
  String get phoneno_label {
    return Intl.message(
      'Phone No',
      name: 'phoneno_label',
      desc: '',
      args: [],
    );
  }

  /// `Empty`
  String get empty_label {
    return Intl.message(
      'Empty',
      name: 'empty_label',
      desc: '',
      args: [],
    );
  }

  /// `Register Success`
  String get register_success_label {
    return Intl.message(
      'Register Success',
      name: 'register_success_label',
      desc: '',
      args: [],
    );
  }

  /// `User not found`
  String get user_not_found_error {
    return Intl.message(
      'User not found',
      name: 'user_not_found_error',
      desc: '',
      args: [],
    );
  }

  /// `Please check your login data`
  String get check_login_data_error {
    return Intl.message(
      'Please check your login data',
      name: 'check_login_data_error',
      desc: '',
      args: [],
    );
  }

  /// `Username unavailable`
  String get user_not_available_error {
    return Intl.message(
      'Username unavailable',
      name: 'user_not_available_error',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'id'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
