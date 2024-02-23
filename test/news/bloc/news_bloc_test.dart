import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:magnus_flutter_kelvin_prayitno/domain/models/response/news_response.dart';
import 'package:magnus_flutter_kelvin_prayitno/domain/repositories/api_repository.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/news/bloc/news_bloc.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/news/events/news_event.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/news/states/news_state.dart';
import 'package:magnus_flutter_kelvin_prayitno/utils/enum/news_enum.dart';
import 'package:mocktail/mocktail.dart';

import '../raw/news_api_raw.dart';

class MockApiRepository extends Mock implements ApiRepository {}

void main() {
  late MockApiRepository mockApiRepository;
  late NewsBloc newsBloc;

  setUp(() async {
    EquatableConfig.stringify = true;
    mockApiRepository = MockApiRepository();
    newsBloc = NewsBloc(mockApiRepository);
  });

  var newsErrorMessage = NewsResponse.fromJson(jsonDecode(newsErrorRaw));
  NewsResponse newsModel = NewsResponse.fromJson(jsonDecode(newsRawResponse));
  NewsResponse newsEmptyArticleModel = NewsResponse.fromJson(jsonDecode(newsEmptyArticleRawResponse));

  blocTest<NewsBloc, NewsState>("Test News Bloc Success State",
      build: () {
        when(() => mockApiRepository.fetchNews(q: "bitcoin", page: 1)).thenAnswer((_) async => Future.value(newsModel));

        return newsBloc;
      },
      act: (bloc) => newsBloc.add(const NewsFetchEvent(true, query: "bitcoin")),
      expect: () => [NewsStateLoading(), NewsStateSuccess(result: newsModel.articles ?? [])]);

  blocTest<NewsBloc, NewsState>("Test News Bloc Error State - Empty Query",
      build: () {
        when(() => mockApiRepository.fetchNews(q: "", page: 1)).thenAnswer((_) async => Future.value(newsErrorMessage));

        return newsBloc;
      },
      act: (bloc) => newsBloc.add(const NewsFetchEvent(true, query: "")),
      expect: () => [NewsStateError(error: NewsError.emptyQuery)]);

  blocTest<NewsBloc, NewsState>("Test News Bloc Error State - No Article Found",
      build: () {
        when(() => mockApiRepository.fetchNews(q: "asda", page: 1)).thenAnswer((_) async => Future.value(newsEmptyArticleModel));

        return newsBloc;
      },
      act: (bloc) => newsBloc.add(const NewsFetchEvent(true, query: "asda")),
      expect: () => [NewsStateLoading(), NewsStateError(error: NewsError.noResult)]);

  blocTest<NewsBloc, NewsState>("Test News Bloc Error State - Connection Error",
      build: () {
        when(() => mockApiRepository.fetchNews(q: "bitcoin", page: 1)).thenAnswer((_) async => Future.value(throw Exception("")));

        return newsBloc;
      },
      act: (bloc) => newsBloc.add(const NewsFetchEvent(true, query: "bitcoin")),
      expect: () => [NewsStateLoading(), NewsStateError(error: NewsError.other)]);
}
