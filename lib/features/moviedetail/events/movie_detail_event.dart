import 'package:equatable/equatable.dart';

abstract class MovieDetailEvent extends Equatable {
  const MovieDetailEvent();

  @override
  List<Object?> get props => [];
}

class MovieDetailTabEvent extends MovieDetailEvent {
  final int pos;
  const MovieDetailTabEvent(this.pos);
}
