import 'package:equatable/equatable.dart';

import '../../domain/models/response/game_list_response.dart';
import '../events/game_list_event.dart';

abstract class GameListState extends Equatable {
  @override
  List<Object?> get props => [];
}

class GameListStateInit extends GameListState {}

class GameListStateLoading extends GameListState {}

class GameListStateLoadMore extends GameListState {}

class GameListStateError extends GameListState {
  final String error;

  GameListStateError({required this.error});
}

class GameListStateSuccess extends GameListState {
  final List<GameListData> result;
  final ListLayout? listLayout;

  GameListStateSuccess({required this.result, this.listLayout});
}

class GameListStateLayoutType extends GameListState {
  final ListLayout? layoutType;

  GameListStateLayoutType({this.layoutType});
}
