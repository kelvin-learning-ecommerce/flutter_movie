import 'package:equatable/equatable.dart';

abstract class GameListEvent extends Equatable {
  const GameListEvent();

  @override
  List<Object?> get props => [];
}

class GameListLoadingEvent extends GameListEvent {

  const GameListLoadingEvent();
}

class GameListChangeLangEvent extends GameListEvent {

  final String lang;

  const GameListChangeLangEvent({required this.lang});
}

class GameListFetchEvent extends GameListEvent {

  const GameListFetchEvent();
}

enum ListLayout{
  listview, gridview
}

class GameListChangeLayoutEvent extends GameListEvent {

  final ListLayout listLayout;

  const GameListChangeLayoutEvent({required this.listLayout});
}
