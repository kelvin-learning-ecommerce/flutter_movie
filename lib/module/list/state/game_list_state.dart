import 'package:equatable/equatable.dart';

import '../event/game_list_event.dart';
import '../model/game_list_model.dart';

abstract class GameListState extends Equatable {
  @override
  List<Object?> get props => [];
}

class GameListStateInit extends GameListState {}

class GameListStateLoading extends GameListState {}

class GameListStateError extends GameListState {
  final String error;

  GameListStateError({required this.error});
}

class GameListStateSuccess extends GameListState {
  final List<GameListData> result;
  final ListLayout listLayout;

  GameListStateSuccess({required this.result, required this.listLayout});
}

class GameListStateLayoutType extends GameListState {
  final ListLayout layoutType;

  GameListStateLayoutType({required this.layoutType});
}
