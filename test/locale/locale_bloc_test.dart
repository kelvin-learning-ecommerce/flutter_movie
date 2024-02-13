
import 'package:bloc_test/bloc_test.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_coding_challenge/presentation/blocs/locale_bloc.dart';
import 'package:flutter_coding_challenge/presentation/events/locale_event.dart';
import 'package:flutter_coding_challenge/presentation/states/locale_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late LocaleBloc localeBloc;

  setUp(() async {
    EquatableConfig.stringify = true;

    localeBloc = LocaleBloc();
  });

  blocTest<LocaleBloc, LocaleState>("Test bloc for success call game list api by query page 1",
      build: () {
        return localeBloc;
      },
      // => gameListBloc,
      act: (bloc) => localeBloc.add(const LocaleChangeLangEvent()),
      expect: () => [LocaleStateLoading(), LocaleStateChangeLocale()]);
}
