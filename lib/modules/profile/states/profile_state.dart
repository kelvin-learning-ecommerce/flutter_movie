import 'package:equatable/equatable.dart';

import '../../../domain/models/entity/user_entity.dart';

abstract class ProfileState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProfileStateInit extends ProfileState {}

class ProfileStateLogoutSuccess extends ProfileState {
  ProfileStateLogoutSuccess();
}

class ProfileStateLoadSuccess extends ProfileState {
  final UserEntity user;
  ProfileStateLoadSuccess(this.user);
}
