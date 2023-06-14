import 'package:equatable/equatable.dart';

abstract class LocaleState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LocaleStateInit extends LocaleState {}

class LocaleStateLoading extends LocaleState {}

class LocaleStateChangeLocale extends LocaleState {}
