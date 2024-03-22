import 'package:equatable/equatable.dart';

abstract class SplashScreenState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SplashScreenStateInit extends SplashScreenState {}

class SplashScreenStateSuccess extends SplashScreenState {
  SplashScreenStateSuccess();
}
