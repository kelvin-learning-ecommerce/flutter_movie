
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:magnus_flutter_kelvin_prayitno/features/newsdetail/bloc/movie_detail_bloc.dart';
import 'package:magnus_flutter_kelvin_prayitno/features/newsdetail/events/movie_detail_event.dart';
import 'package:magnus_flutter_kelvin_prayitno/features/newsdetail/states/movie_detail_state.dart';

void main() {
  late MovieDetailBloc newsDetailBloc;

  setUp(() async {
    newsDetailBloc = MovieDetailBloc();
  });

  blocTest<MovieDetailBloc, MovieDetailState>("Test Register Bloc Tab Change Success State",
      build: () => newsDetailBloc,
      act: (bloc) => newsDetailBloc.add(const MovieDetailTabEvent(0)),
      expect: () => [MovieDetailStateInit(), MovieDetailStateTabChange(0)]);
}
