import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LocaleState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LocaleStateInit extends LocaleState {}

class LocaleStateLoading extends LocaleState {}

class LocaleStateChangeLocale extends LocaleState {
  final Locale? locale;

  LocaleStateChangeLocale({this.locale});
}
