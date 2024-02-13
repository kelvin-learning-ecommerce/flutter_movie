import 'package:equatable/equatable.dart';

import '../../domain/models/response/game_detail_response.dart';


abstract class GameDetailState extends Equatable {
  @override
  List<Object?> get props => [];
}

class GameDetailInitState extends GameDetailState {}

class GameDetailLoadingState extends GameDetailState {}

class GameDetailLoadTabState extends GameDetailState {}

class GameDetailErrorState extends GameDetailState {
  GameDetailErrorState();
}

class GameDetailSuccessState extends GameDetailState {
  final GameDetailResponse result;

  GameDetailSuccessState(this.result);
}

class GameDetailTabState extends GameDetailState {
  final int position;

  GameDetailTabState(this.position);
}
