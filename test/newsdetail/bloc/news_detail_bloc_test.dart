import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:magnus_flutter_kelvin_prayitno/domain/models/entity/user_entity.dart';
import 'package:magnus_flutter_kelvin_prayitno/domain/models/response/news_response.dart';
import 'package:magnus_flutter_kelvin_prayitno/domain/repositories/api_repository.dart';
import 'package:magnus_flutter_kelvin_prayitno/domain/repositories/floor_repository.dart';
import 'package:magnus_flutter_kelvin_prayitno/domain/repositories/storage_repository.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/login/bloc/login_bloc.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/login/events/login_event.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/login/states/login_state.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/news/bloc/news_bloc.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/news/events/news_event.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/news/states/news_state.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/newsdetail/bloc/news_detail_bloc.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/newsdetail/events/news_detail_event.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/newsdetail/states/news_detail_state.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/register/bloc/register_bloc.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/register/events/register_event.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/register/states/register_state.dart';
import 'package:magnus_flutter_kelvin_prayitno/utils/enum/login_error_enum.dart';
import 'package:magnus_flutter_kelvin_prayitno/utils/enum/news_enum.dart';
import 'package:magnus_flutter_kelvin_prayitno/utils/enum/register_error_enum.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  late NewsDetailBloc newsDetailBloc;

  setUp(() async {
    newsDetailBloc = NewsDetailBloc();
  });

  blocTest<NewsDetailBloc, NewsDetailState>("Test Register Bloc Tab Change Success State",
      build: () => newsDetailBloc,
      act: (bloc) => newsDetailBloc.add(const NewsDetailTabEvent(0)),
      expect: () => [NewsDetailStateInit(), NewsDetailStateTabChange(0)]);
}
