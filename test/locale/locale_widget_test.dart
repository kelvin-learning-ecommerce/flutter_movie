import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_coding_challenge/config/DI/di_locator.dart';
import 'package:flutter_coding_challenge/generated/l10n.dart';
import 'package:flutter_coding_challenge/presentation/blocs/game_list_bloc.dart';
import 'package:flutter_coding_challenge/presentation/blocs/locale_bloc.dart';
import 'package:flutter_coding_challenge/presentation/events/game_list_event.dart';
import 'package:flutter_coding_challenge/presentation/events/locale_event.dart';
import 'package:flutter_coding_challenge/presentation/states/game_list_state.dart';
import 'package:flutter_coding_challenge/presentation/states/locale_state.dart';
import 'package:flutter_coding_challenge/presentation/views/components/locale_component.dart';
import 'package:flutter_coding_challenge/presentation/views/game_list_view.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLocaleBloc extends MockBloc<LocaleEvent, LocaleState> implements LocaleBloc {}

void main(){
  late MockLocaleBloc mockLocaleBloc;

  group('Change Language Widget Test', () {
    setUpAll(() {
      mockLocaleBloc = MockLocaleBloc();
    });

    TestWidgetsFlutterBinding.ensureInitialized();
    configureDependencies();

    testWidgets('Game List Page Change Language Test', (WidgetTester tester) async {
      // arrange
      when(() => mockLocaleBloc.state).thenReturn(
        LocaleStateChangeLocale(), // the desired state
      );

      // find
      var testedWidget = const LocaleComponent();
      final textWidget = find.byType(Image);

      await tester.pumpWidget(parentWidget(testedWidget, mockLocaleBloc));

      expect(textWidget, findsWidgets);
    });

    testWidgets('Game List Page Change Language Test Loading State', (WidgetTester tester) async {
      // arrange
      when(() => mockLocaleBloc.state).thenReturn(
        LocaleStateLoading(), // the desired state
      );

      // find
      var testedWidget = const LocaleComponent();
      final imageWidget = find.byType(Image);

      await tester.pumpWidget(parentWidget(testedWidget, mockLocaleBloc));

      expect(imageWidget, findsNothing);
    });

    testWidgets('Game List Page Change Language - Test Tap', (WidgetTester tester) async {
      // arrange
      when(() => mockLocaleBloc.state).thenReturn(
        LocaleStateChangeLocale(), // the desired state
      );

      // find
      var testedWidget = const LocaleComponent();
      final inkWellWidget = find.byKey(const Key("changeLanguageButton"));

      await tester.pumpWidget(parentWidget(testedWidget, mockLocaleBloc));

      await tester.tap(inkWellWidget);

      await tester.pumpAndSettle();

      expect(find.byKey(const Key("Locale default widget")), findsNothing);
    });
  });

  tearDown(() {
    mockLocaleBloc.close();
  });
}

parentWidget(Widget body, MockLocaleBloc bloc) => ScreenUtilInit(
  minTextAdapt: true,
  builder: (BuildContext context, Widget? child) {
    return MaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      title: 'Widget Test',
      home: BlocProvider<LocaleBloc>(
        create: (context) => bloc,
        child: Scaffold(body: body),
      ),
    );
  },
);
