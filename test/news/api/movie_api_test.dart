import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:magnus_flutter_kelvin_prayitno/config/DI/di_locator.dart';
import 'package:magnus_flutter_kelvin_prayitno/domain/models/response/movie_response.dart';
import 'package:magnus_flutter_kelvin_prayitno/domain/repositories/api_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

import '../raw/movie_api_raw.dart';

class MockedApiRepository extends Mock implements ApiRepository {}

void main() {
  late MockedApiRepository mockedApiRepository;

  configureDependencies();

  setUp(() async {
    EquatableConfig.stringify = true;
    mockedApiRepository = MockedApiRepository();
    locator.registerFactory<MockedApiRepository>(() => mockedApiRepository);
  });

  MovieResponse movieModel = MovieResponse.fromJson(jsonDecode(movieRawResponse));

  test('Game List Test', () async {
    when(() => mockedApiRepository.fetchMovie(q: "")).thenAnswer((_) async => Future.value(movieModel));

    expect(
      await mockedApiRepository.fetchMovie(q: ""),
      movieModel,
    );
  });
}
