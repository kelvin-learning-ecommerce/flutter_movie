import 'package:equatable/equatable.dart';

abstract class LocaleEvent extends Equatable {
  const LocaleEvent();

  @override
  List<Object?> get props => [];
}

class LocaleChangeLangEvent extends LocaleEvent {
  const LocaleChangeLangEvent();
}
