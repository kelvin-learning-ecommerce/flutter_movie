import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_coding_challenge/presentation/events/game_detail_event.dart';
import 'package:flutter_coding_challenge/presentation/states/game_detail_state.dart';
import 'package:injectable/injectable.dart';

import '../../config/router/navigation_config.dart';
import '../../domain/repositories/api_repository.dart';

var gameDetailBloc = navigationService.navigatorKey.currentContext?.read<GameDetailBloc>();

@injectable
class GameDetailBloc extends Bloc<GameDetailEvent, GameDetailState> {
  final ApiRepository apiRepository;

  GameDetailBloc(this.apiRepository) : super(GameDetailInitState()) {
    on<GameDetailEventFetch>((event, emit) async {
      emit(GameDetailLoadingState());

      try {
        var response = await apiRepository.fetchGameDetail(event.id);

        emit(GameDetailSuccessState(response));
      } catch (e) {
        emit(GameDetailErrorState());
      }
    });
    on<GameDetailTabEvent>((event, emit) async {
      emit(GameDetailLoadTabState());

      emit(GameDetailTabState(event.pos));
    });
  }
}
