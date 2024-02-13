import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_coding_challenge/config/DI/di_locator.dart';
import 'package:flutter_coding_challenge/domain/models/response/game_list_response.dart';
import 'package:flutter_coding_challenge/domain/repositories/api_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'game_list_raw.dart';

class MockedApiRepository extends Mock implements ApiRepository {}

void main() {
  late MockedApiRepository mockedApiRepository;

  configureDependencies();

  setUp(() async {
    EquatableConfig.stringify = true;
    mockedApiRepository = MockedApiRepository();
    locator.registerFactory<MockedApiRepository>(() => mockedApiRepository);
  });

  GameListResponse gameListRawModel = GameListResponse.fromJson(jsonDecode(gameListRawString));

  test('Game List Test', () async {
    GameListResponse gameListMockModel = GameListResponse.fromJson(jsonDecode(gameListRawString));

    when(() => mockedApiRepository.fetchGameList(1, url: 'https://api.rawg.io/api/games'))
        .thenAnswer((_) async => Future.value(gameListMockModel));

    expect(
      await mockedApiRepository.fetchGameList(1, url: 'https://api.rawg.io/api/games'),
      gameListRawModel,
    );
  });
}
