import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_coding_challenge/module/list/model/game_list_model.dart';
import 'package:flutter_coding_challenge/network/api_repository.dart';
import 'package:flutter_coding_challenge/network/base_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'game_data_api_test.mocks.dart';
import 'game_list_raw.dart';

@GenerateMocks([Dio])
void main() {
  late MockDio mockDio;
  late ApiRepository apiRepository;
  late BaseService baseService;

  setUp(() async {
    EquatableConfig.stringify = true;
    mockDio = MockDio();
    baseService = BaseService(dio: mockDio);
    apiRepository = ApiRepository(baseService: baseService);
  });

  GameListResponse gameListRawModel = GameListResponse.fromJson(jsonDecode(gameListRawString));

  var queryParam = {
    "page": 1,
    "page_size": 20,
    "platforms": '187',
    "ordering": "-released",
    "key": "02ef6ba5d13444ee86bad607e8bce3f4",
    "dates": "2018-12-21,2021-12-21"
  };

  test('Game List Test', () async {
    when(mockDio.get(
      'https://api.rawg.io/api/games',
      queryParameters: queryParam,
    )).thenAnswer((_) => Future.value(Response(
          statusCode: 200,
          data: gameListRawString,
          requestOptions: RequestOptions(path: 'https://api.rawg.io/api/games', queryParameters: queryParam),
        )));

    expect(
      await apiRepository.fetchGameList(1, url: 'https://api.rawg.io/api/games'),
      gameListRawModel,
    );
  });
}
