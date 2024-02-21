import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginStateInit extends LoginState {}

class LoginStateLoading extends LoginState {}

class LoginStateError extends LoginState {
  LoginStateError();
}

class LoginStateSuccess extends LoginState {
  LoginStateSuccess();
}
