
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/newsdetail/bloc/news_detail_bloc.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/newsdetail/events/news_detail_event.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/newsdetail/states/news_detail_state.dart';

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
