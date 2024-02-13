import 'package:bloc_test/bloc_test.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_coding_challenge/domain/models/response/game_detail_response.dart';
import 'package:flutter_coding_challenge/domain/repositories/api_repository.dart';
import 'package:flutter_coding_challenge/presentation/blocs/game_detail_bloc.dart';
import 'package:flutter_coding_challenge/presentation/events/game_detail_event.dart';
import 'package:flutter_coding_challenge/presentation/states/game_detail_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockApiRepository extends Mock implements ApiRepository {}

void main() {
  late MockApiRepository mockApiRepository;
  late GameDetailBloc gameDetailBloc;

  setUp(() async {
    EquatableConfig.stringify = true;
    mockApiRepository = MockApiRepository();
    gameDetailBloc = GameDetailBloc(mockApiRepository);
  });

  blocTest<GameDetailBloc, GameDetailState>("Test Game Detail bloc Error State",
      build: () {
        when(() => mockApiRepository.fetchGameDetail(494383))
            .thenAnswer((_) async => Future.value(GameDetailResponse()));

        return gameDetailBloc;
      },
      act: (bloc) => gameDetailBloc.add(const GameDetailEventFetch(0)),
      expect: () => [GameDetailLoadingState(), GameDetailErrorState()]);

  blocTest<GameDetailBloc, GameDetailState>("Test Game Detail bloc Success State",
      build: () {
        when(() => mockApiRepository.fetchGameDetail(494383))
            .thenAnswer((_) async => Future.value(GameDetailResponse()));

        return gameDetailBloc;
      },
      act: (bloc) => gameDetailBloc.add(const GameDetailEventFetch(494383)),
      expect: () => [GameDetailLoadingState(), GameDetailSuccessState(GameDetailResponse())]);

  blocTest<GameDetailBloc, GameDetailState>("Test Game Detail bloc",
      build: () => gameDetailBloc,
      act: (bloc) => gameDetailBloc.add(const GameDetailTabEvent(0)),
      expect: () => [GameDetailLoadTabState(), GameDetailTabState(0)]);
}
