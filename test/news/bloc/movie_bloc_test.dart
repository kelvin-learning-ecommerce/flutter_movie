import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:magnus_flutter_kelvin_prayitno/domain/models/response/movie_response.dart';
import 'package:magnus_flutter_kelvin_prayitno/domain/repositories/api_repository.dart';
import 'package:magnus_flutter_kelvin_prayitno/features/movie/bloc/movie_bloc.dart';
import 'package:magnus_flutter_kelvin_prayitno/features/movie/events/movie_event.dart';
import 'package:magnus_flutter_kelvin_prayitno/features/movie/states/movie_state.dart';
import 'package:magnus_flutter_kelvin_prayitno/utils/enum/news_enum.dart';
import 'package:mocktail/mocktail.dart';

import '../raw/news_api_raw.dart';

class MockApiRepository extends Mock implements ApiRepository {}

void main() {
  late MockApiRepository mockApiRepository;
  late MovieBloc movieBloc;

  setUp(() async {
    EquatableConfig.stringify = true;
    mockApiRepository = MockApiRepository();
    movieBloc = MovieBloc(mockApiRepository);
  });

  var newsErrorMessage = MovieResponse.fromJson(jsonDecode(newsErrorRaw));
  MovieResponse newsModel = MovieResponse.fromJson(jsonDecode(newsRawResponse));
  MovieResponse newsEmptyArticleModel = MovieResponse.fromJson(jsonDecode(newsEmptyArticleRawResponse));

  blocTest<MovieBloc, MovieState>("Test News Bloc Success State",
      build: () {
        when(() => mockApiRepository.fetchMovie(
              q: "bitcoin",
            )).thenAnswer((_) async => Future.value(newsModel));

        return movieBloc;
      },
      act: (bloc) => movieBloc.add(const MovieFetchEvent(query: "bitcoin")),
      expect: () => [MovieStateLoading(), MovieStateSuccess(result: newsModel.results ?? [])]);

  blocTest<MovieBloc, MovieState>("Test News Bloc Error State - Empty Query",
      build: () {
        when(() => mockApiRepository.fetchMovie(
              q: "",
            )).thenAnswer((_) async => Future.value(newsErrorMessage));

        return movieBloc;
      },
      act: (bloc) => movieBloc.add(const MovieFetchEvent(query: "")),
      expect: () => [MovieStateError(error: NewsError.emptyQuery)]);

  blocTest<MovieBloc, MovieState>("Test News Bloc Error State - No Article Found",
      build: () {
        when(() => mockApiRepository.fetchMovie(q: "asda"))
            .thenAnswer((_) async => Future.value(newsEmptyArticleModel));

        return movieBloc;
      },
      act: (bloc) => movieBloc.add(const MovieFetchEvent(query: "asda")),
      expect: () => [MovieStateLoading(), MovieStateError(error: NewsError.noResult)]);

  blocTest<MovieBloc, MovieState>("Test News Bloc Error State - Connection Error",
      build: () {
        when(() => mockApiRepository.fetchMovie(q: "")).thenAnswer((_) async => Future.value(throw Exception("")));

        return movieBloc;
      },
      act: (bloc) => movieBloc.add(const MovieFetchEvent(query: "")),
      expect: () => [MovieStateLoading(), MovieStateError(error: NewsError.other)]);
}
