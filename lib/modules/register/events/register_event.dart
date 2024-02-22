import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object?> get props => [];
}

class RegisterAttemptEvent extends RegisterEvent {
  final String username;
  final String password;
  final String name;
  final String phoneno;
  const RegisterAttemptEvent(this.username, this.password, this.name, this.phoneno);
}
