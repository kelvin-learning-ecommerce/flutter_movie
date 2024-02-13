import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_coding_challenge/data/repositories/api_repository_impl.dart';
import 'package:flutter_coding_challenge/data/repositories/base/api_service.dart';
import 'package:flutter_coding_challenge/domain/models/response/game_list_response.dart';
import 'package:flutter_coding_challenge/domain/repositories/api_repository.dart';
import 'package:flutter_coding_challenge/presentation/blocs/game_list_bloc.dart';
import 'package:flutter_coding_challenge/presentation/events/game_list_event.dart';
import 'package:flutter_coding_challenge/presentation/states/game_list_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mocktail/mocktail.dart';

import 'game_list_raw.dart';
import 'gamelist_bloc_test.mocks.dart';

class MockApiRepository extends Mock implements ApiRepository {}

@GenerateMocks([Dio])
void main() {
  late MockDio mockDio;
  late MockApiRepository mockApiRepository;
  late ApiService baseService;
  late GameListBloc gameListBloc;

  setUp(() async {
    EquatableConfig.stringify = true;
    mockDio = MockDio();
    baseService = ApiServiceImpl(dio: mockDio);
    mockApiRepository = MockApiRepository();
    gameListBloc = GameListBloc(mockApiRepository);
  });

  blocTest<GameListBloc, GameListState>("Test bloc for success call game list api by query page 1",
      build: () {
        when(() => mockApiRepository.fetchGameList(1)).thenAnswer((_) async => Future.value(const GameListResponse()));
        return gameListBloc;
      },
      // => gameListBloc,
      act: (bloc) => gameListBloc.add(const GameListFetchEvent(true)),
      expect: () => [
            GameListStateLoading(),
            GameListStateSuccess(result: const []),
          ]);

  blocTest<GameListBloc, GameListState>("Test bloc for success call game list api by query page 0",
      build: () {
        when(() => mockApiRepository.fetchGameList(0)).thenAnswer((_) async => Future.value(const GameListResponse()));
        return gameListBloc;
      },
      // => gameListBloc,
      act: (bloc) => gameListBloc.add(const GameListFetchEvent(true)),
      expect: () => [
            GameListStateLoading(),
            GameListStateError(error: ''),
          ]);

  blocTest<GameListBloc, GameListState>("Test List Change Layout bloc",
      build: () => gameListBloc,
      act: (bloc) => gameListBloc.add(const GameListChangeLayoutEvent()),
      expect: () => [
            GameListStateLoading(),
            GameListStateSuccess(listLayout: ListLayout.listview, result: const []),
            GameListStateLayoutType()
          ]);
}
