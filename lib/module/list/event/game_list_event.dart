import 'package:equatable/equatable.dart';

abstract class GameListEvent extends Equatable {
  const GameListEvent();

  @override
  List<Object?> get props => [];
}

class GameListLoadingEvent extends GameListEvent {
  const GameListLoadingEvent();
}

class GameListFetchEvent extends GameListEvent {
  final bool isFirstPage;
  const GameListFetchEvent(this.isFirstPage);
}

enum ListLayout { listview, gridview }

class GameListChangeLayoutEvent extends GameListEvent {
  const GameListChangeLayoutEvent();
}
