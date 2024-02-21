import 'package:equatable/equatable.dart';

abstract class SplashScreenEvent extends Equatable {
  const SplashScreenEvent();

  @override
  List<Object?> get props => [];
}

class SplashScreenNextPageEvent extends SplashScreenEvent {
  const SplashScreenNextPageEvent();
}
