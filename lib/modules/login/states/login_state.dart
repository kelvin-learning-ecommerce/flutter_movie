import 'package:equatable/equatable.dart';

import '../../../utils/enum/login_error_enum.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginStateInit extends LoginState {}

class LoginStateLoading extends LoginState {}

class LoginStateError extends LoginState {
  final LoginError error;
  LoginStateError(this.error);
}

class LoginStateSuccess extends LoginState {
  LoginStateSuccess();
}
