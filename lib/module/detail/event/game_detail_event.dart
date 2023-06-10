import 'package:equatable/equatable.dart';

abstract class GameDetailEvent extends Equatable {
  const GameDetailEvent();

  @override
  List<Object?> get props => [];
}

class GameDetailEventFetch extends GameDetailEvent {
  final int id;

  const GameDetailEventFetch(this.id);
}

class GameDetailTabEvent extends GameDetailEvent {
  final int pos;

  const GameDetailTabEvent(this.pos);
}
