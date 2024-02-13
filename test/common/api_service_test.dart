import 'dart:convert';

import 'package:flutter_coding_challenge/config/DI/di_locator.dart';
import 'package:flutter_coding_challenge/data/repositories/base/api_service.dart';
import 'package:flutter_coding_challenge/domain/models/response/game_detail_response.dart';
import 'package:flutter_coding_challenge/domain/models/response/game_list_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../gamedetail/game_detail_raw.dart';
import '../gamelist/game_list_raw.dart';

class MockApiService extends Mock implements ApiService {}

void main() {
  late MockApiService mockApiService;
  configureDependencies();

  setUp(() async {
    mockApiService = MockApiService();
    // locator.registerFactory<MockApiService>(() => mockApiService);
  });

  GameListResponse gameListRawModel = GameListResponse.fromJson(jsonDecode(gameListRawString));

  GameDetailResponse gameDetailMockModel = GameDetailResponse.fromJson(jsonDecode(gameDetailRawString));

  test('Fetch Game Detail Test', () async {
    when(() => mockApiService.fetchGameDetail(494383)).thenAnswer((_) async => Future.value(gameDetailMockModel));

    expect(
      await mockApiService.fetchGameDetail(494383),
      gameDetailMockModel,
    );
  });

  test('Game List Test', () async {
    GameListResponse gameListMockModel = GameListResponse.fromJson(jsonDecode(gameListRawString));

    when(() => mockApiService.fetchGameList(url: 'https://api.rawg.io/api/games'))
        .thenAnswer((_) async => Future.value(gameListMockModel));

    expect(
      await mockApiService.fetchGameList(url: 'https://api.rawg.io/api/games'),
      gameListRawModel,
    );
  });
}
