import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class LoginAttemptEvent extends LoginEvent {
  final String username;
  final String password;
  const LoginAttemptEvent(this.username, this.password);
}
