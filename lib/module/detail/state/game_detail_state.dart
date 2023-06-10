import 'package:equatable/equatable.dart';

import '../model/game_detail_model.dart';


abstract class GameDetailState extends Equatable {
  @override
  List<Object?> get props => [];
}

class GameDetailInitState extends GameDetailState {}

class GameDetailLoadingState extends GameDetailState {}

class GameDetailLoadTabState extends GameDetailState {}

class GameDetailErrorState extends GameDetailState {
  final String error;

  GameDetailErrorState(this.error);
}

class GameDetailSuccessState extends GameDetailState{
  final GameDetailResponse result;

  GameDetailSuccessState(this.result);
}

class GameDetailTabState extends GameDetailState{
  final int position;

  GameDetailTabState(this.position);
}