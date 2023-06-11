import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_coding_challenge/module/list/bloc/game_list_bloc.dart';
import 'package:flutter_coding_challenge/module/list/event/game_list_event.dart';
import 'package:flutter_coding_challenge/module/list/state/game_list_state.dart';
import 'package:flutter_coding_challenge/network/api_repository.dart';
import 'package:flutter_coding_challenge/network/base_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'bloc_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late MockDio mockDio;
  late ApiRepository apiRepository;
  late BaseService baseService;
  late GameListBloc gameListBloc;

  setUp(() async {
    EquatableConfig.stringify = true;
    mockDio = MockDio();
    baseService = BaseService(dio: mockDio);
    apiRepository = ApiRepository(baseService: baseService);
    gameListBloc = GameListBloc(apiRepository);
  });

  blocTest<GameListBloc, GameListState>("Test bloc",
      build: () => gameListBloc,
      act: (bloc) => gameListBloc.add(const GameListChangeLayoutEvent()),
      expect: () => [
            GameListStateLoading(),
            GameListStateSuccess(listLayout: ListLayout.listview, result: const []),
            GameListStateLayoutType(layoutType: ListLayout.listview)
          ]);
}
