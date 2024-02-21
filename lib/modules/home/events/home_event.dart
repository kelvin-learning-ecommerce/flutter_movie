import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

// class HomeEvent extends HomeEvent {
//   final bool isFirstPage;
//   const LoginAttempEvent(this.isFirstPage);
// }
