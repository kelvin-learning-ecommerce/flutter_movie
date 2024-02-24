import 'package:equatable/equatable.dart';

import '../../../utils/enum/register_error_enum.dart';

abstract class RegisterState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegisterStateInit extends RegisterState {}

class RegisterStateError extends RegisterState {
  final RegisterError error;
  RegisterStateError(this.error);
}

class RegisterStateSuccess extends RegisterState {
  RegisterStateSuccess();
}
