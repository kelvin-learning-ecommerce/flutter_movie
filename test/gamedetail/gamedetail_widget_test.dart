import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_coding_challenge/domain/models/response/game_detail_response.dart';
import 'package:flutter_coding_challenge/generated/l10n.dart';
import 'package:flutter_coding_challenge/presentation/blocs/game_detail_bloc.dart';
import 'package:flutter_coding_challenge/presentation/events/game_detail_event.dart';
import 'package:flutter_coding_challenge/presentation/states/game_detail_state.dart';
import 'package:flutter_coding_challenge/presentation/views/game_detail_view.dart';
import 'package:flutter_coding_challenge/presentation/views/game_detail_view_ext.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGameDetailPageBloc extends MockBloc<GameDetailEvent, GameDetailState> implements GameDetailBloc {}

void main() {
  late MockGameDetailPageBloc mockGameDetailPageBloc;

  group('Game Detail Page UI Test', () {
    setUpAll(() {
      mockGameDetailPageBloc = MockGameDetailPageBloc();
    });

    TestWidgetsFlutterBinding.ensureInitialized();

    testWidgets('Game Detail Page UI Test Success State', (WidgetTester tester) async {
      // arrange
      when(() => mockGameDetailPageBloc.state).thenReturn(
        GameDetailSuccessState(GameDetailResponse()), // the desired state
      );

      // find
      var testedWidget = GameDetailContentWidget(
        title: '',
        data: GameDetailResponse(),
      );
      final refreshIndicatorWidget = find.byType(NestedScrollView);

      await tester.pumpWidget(parentWidget(testedWidget, mockGameDetailPageBloc));

      expect(refreshIndicatorWidget, findsOneWidget);
    });

    testWidgets('Game Detail Page UI Test Loading State', (WidgetTester tester) async {
      // arrange
      when(() => mockGameDetailPageBloc.state).thenReturn(
        GameDetailLoadingState(), // the desired state
      );

      // find
      var testedWidget = const GameDetailBody(title: '');
      final refreshIndicatorWidget = find.byType(RefreshProgressIndicator);

      await tester.pumpWidget(parentWidget(testedWidget, mockGameDetailPageBloc));

      expect(refreshIndicatorWidget, findsOneWidget);
    });

    testWidgets('Game Detail Page UI Test Error State', (WidgetTester tester) async {
      // arrange
      when(() => mockGameDetailPageBloc.state).thenReturn(
        GameDetailErrorState(), // the desired state
      );

      // find
      var testedWidget = const GameDetailBody(title: '');
      final textErrorWidget = find.byType(Text);

      await tester.pumpWidget(parentWidget(testedWidget, mockGameDetailPageBloc));

      expect(textErrorWidget, findsOneWidget);
    });

    testWidgets('Game Detail Page UI Tab View Behavior Test', (WidgetTester tester) async {
      // find
      var testedWidget = GameDetailContentWidget(
        title: '',
        data: GameDetailResponse(),
      );

      await tester.pumpWidget(parentWidget(testedWidget, mockGameDetailPageBloc));

      // Verify the presence of tabs
      expect(find.text('Info'), findsOneWidget);
      expect(find.text('Screenshot'), findsOneWidget);
    });

    testWidgets('Info Tab UI Test', (WidgetTester tester) async {
      // find
      final widget = InfoTab(detail: GameDetailResponse());
      final listViewWidget = find.byKey(const Key("infoTab Listview"));

      // test
      await tester.pumpWidget(parentWidget(widget, mockGameDetailPageBloc));
      await tester.pumpAndSettle();

      // expect
      expect(listViewWidget, findsOneWidget);
    });

    testWidgets('Screenshot Tab UI Test contain listview', (WidgetTester tester) async {
      // find
      final widget = ScreenshotTab(detail: GameDetailResponse());
      final scrollViewWidget = find.byKey(const Key("screenshotTab ListView.separated"));

      // test
      await tester.pumpWidget(parentWidget(widget, mockGameDetailPageBloc));
      await tester.pumpAndSettle();

      // expect
      expect(scrollViewWidget, findsOneWidget);
    });
  });

  tearDown(() {
    mockGameDetailPageBloc.close();
  });
}

parentWidget(Widget body, MockGameDetailPageBloc bloc) => ScreenUtilInit(
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
          home: BlocProvider<GameDetailBloc>(
            create: (context) => bloc,
            child: Scaffold(body: body),
          ),
        );
      },
    );
