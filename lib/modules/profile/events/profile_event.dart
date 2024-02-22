import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object?> get props => [];
}

class ProfileLogoutAttemptEvent extends ProfileEvent {
  const ProfileLogoutAttemptEvent();
}

class ProfileLoadEvent extends ProfileEvent {
  const ProfileLoadEvent();
}
