import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_coding_challenge/domain/models/response/game_detail_response.dart';
import 'package:flutter_coding_challenge/domain/repositories/api_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'game_detail_raw.dart';

class MockApiRepository extends Mock implements ApiRepository {}

void main() {
  late MockApiRepository mockApiRepository;

  setUp(() async {
    EquatableConfig.stringify = true;
    mockApiRepository = MockApiRepository();
  });

  GameDetailResponse gameDetailMockModel = GameDetailResponse.fromJson(jsonDecode(gameDetailRawString));

  test('Fetch Game Detail Test', () async {
    when(() => mockApiRepository.fetchGameDetail(494383)).thenAnswer((_) async => Future.value(gameDetailMockModel));

    expect(
      await mockApiRepository.fetchGameDetail(494383),
      gameDetailMockModel,
    );
  });
}
