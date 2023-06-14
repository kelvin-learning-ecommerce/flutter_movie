import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_coding_challenge/data/repositories/api_repository_impl.dart';
import 'package:flutter_coding_challenge/data/repositories/base/api_service.dart';
import 'package:flutter_coding_challenge/domain/repositories/api_repository.dart';
import 'package:flutter_coding_challenge/presentation/blocs/game_list_bloc.dart';
import 'package:flutter_coding_challenge/presentation/events/game_list_event.dart';
import 'package:flutter_coding_challenge/presentation/states/game_list_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'bloc_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late MockDio mockDio;
  late ApiRepository apiRepository;
  late ApiService baseService;
  late GameListBloc gameListBloc;

  setUp(() async {
    EquatableConfig.stringify = true;
    mockDio = MockDio();
    baseService = ApiServiceImpl(dio: mockDio);
    apiRepository = ApiRepositoryImpl(baseService: baseService);
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
