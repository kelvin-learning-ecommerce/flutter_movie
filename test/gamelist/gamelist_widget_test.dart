import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_coding_challenge/config/DI/di_locator.dart';
import 'package:flutter_coding_challenge/config/router/routes.dart';
import 'package:flutter_coding_challenge/domain/models/response/game_list_response.dart';
import 'package:flutter_coding_challenge/generated/l10n.dart';
import 'package:flutter_coding_challenge/presentation/blocs/game_detail_bloc.dart';
import 'package:flutter_coding_challenge/presentation/blocs/game_list_bloc.dart';
import 'package:flutter_coding_challenge/presentation/blocs/locale_bloc.dart';
import 'package:flutter_coding_challenge/presentation/events/game_detail_event.dart';
import 'package:flutter_coding_challenge/presentation/events/game_list_event.dart';
import 'package:flutter_coding_challenge/presentation/events/locale_event.dart';
import 'package:flutter_coding_challenge/presentation/states/game_detail_state.dart';
import 'package:flutter_coding_challenge/presentation/states/game_list_state.dart';
import 'package:flutter_coding_challenge/presentation/states/locale_state.dart';
import 'package:flutter_coding_challenge/presentation/views/components/game_list_content_component.dart';
import 'package:flutter_coding_challenge/presentation/views/components/game_list_load_mode_component.dart';
import 'package:flutter_coding_challenge/presentation/views/components/layout_selection_component.dart';
import 'package:flutter_coding_challenge/presentation/views/game_list_view.dart';
import 'package:flutter_coding_challenge/presentation/views/game_list_view_ext.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGameListPageBloc extends MockBloc<GameListEvent, GameListState> implements GameListBloc {}

class MockLocaleBloc extends MockBloc<LocaleEvent, LocaleState> implements LocaleBloc {}

class MockGameDetailPageBloc extends MockBloc<GameDetailEvent, GameDetailState> implements GameDetailBloc {}

void main() {
  late MockGameListPageBloc mockGameListPageBloc;
  late MockLocaleBloc mockLocaleBloc;
  late MockGameDetailPageBloc mockGameDetailPageBloc;
  late dynamic providerList;

  configureDependencies();

  group('Game Detail Page Widget Test', () {
    setUpAll(() {
      mockGameListPageBloc = MockGameListPageBloc();
      mockGameDetailPageBloc = MockGameDetailPageBloc();
      mockLocaleBloc = MockLocaleBloc();

      providerList = [
        BlocProvider<GameListBloc>(
          create: (context) => mockGameListPageBloc,
        ),
        BlocProvider<GameDetailBloc>(
          create: (context) => mockGameDetailPageBloc,
        ),
        BlocProvider<LocaleBloc>(
          create: (context) => mockLocaleBloc,
        ),
      ];
    });

    TestWidgetsFlutterBinding.ensureInitialized();

    testWidgets('Game List Page Main Body', (WidgetTester tester) async {
      when(() => mockLocaleBloc.state).thenReturn(
        LocaleStateChangeLocale(), // the desired state
      );

      when(() => mockGameListPageBloc.state).thenReturn(
        GameListStateLoading(), // the desired state
      );

      // find
      var testedWidget = const GameListScreen();
      final inkWellWidget = find.byKey(const Key("Game List Screen Parent Column"));

      await tester.pumpWidget(multiBlocParentWidget(testedWidget, providerList));
      expect(inkWellWidget, findsOneWidget);
    });

    testWidgets('Game List Page Change Layout Test', (WidgetTester tester) async {
      // arrange
      when(() => mockGameListPageBloc.state).thenReturn(
        GameListStateLayoutType(), // the desired state
      );

      // find
      var testedWidget = const LayoutSelectionComponent();
      final keyWidget = find.byKey(const Key("Layout Selection Info"));

      await tester.pumpWidget(parentWidget(testedWidget, mockGameListPageBloc));

      expect(keyWidget, findsOneWidget);
    });

    testWidgets('Game List Page Change Layout Test Error State', (WidgetTester tester) async {
      // arrange
      when(() => mockGameListPageBloc.state).thenReturn(
        GameListStateLoading(), // the desired state
      );

      // find
      var testedWidget = const LayoutSelectionComponent();
      final keyWidget = find.byKey(const Key("Layout Selection Info"));

      await tester.pumpWidget(parentWidget(testedWidget, mockGameListPageBloc));

      expect(keyWidget, findsNothing);
    });

    testWidgets('Game List Page Change Layout - Test Tap', (WidgetTester tester) async {
      // arrange
      when(() => mockGameListPageBloc.state).thenReturn(
        GameListStateLayoutType(), // the desired state
      );

      // find
      var testedWidget = const LayoutSelectionComponent();
      final inkWellWidget = find.byKey(const Key("GameListChangeLayoutEvent"));

      await tester.pumpWidget(parentWidget(testedWidget, mockGameListPageBloc));

      await tester.tap(inkWellWidget);

      await tester.pumpAndSettle();

      expect(find.byKey(const Key("Layout Selection default widget")), findsNothing);
    });

    testWidgets('Game List Page Content Loading State', (WidgetTester tester) async {
      // arrange
      when(() => mockGameListPageBloc.state).thenReturn(
        GameListStateLoading(), // the desired state
      );

      // find
      var testedWidget = GameListContentComponent(
        scrollController: ScrollController(),
      );
      final refreshProgressWidget = find.byType(RefreshProgressIndicator);

      await tester.pumpWidget(parentWidget(testedWidget, mockGameListPageBloc));

      expect(refreshProgressWidget, findsOneWidget);
    });

    testWidgets('Game List Page Content Success State Grid View Layout', (WidgetTester tester) async {
      // arrange
      when(() => mockGameListPageBloc.state).thenReturn(
        GameListStateSuccess(result: const [], listLayout: ListLayout.gridview), // the desired state
      );

      // find
      var testedWidget = GameListContentComponent(
        scrollController: ScrollController(),
      );
      final gridViewKeyWidget = find.byKey(const Key("Game List Content Component GridView"));

      await tester.pumpWidget(parentWidget(testedWidget, mockGameListPageBloc));

      expect(gridViewKeyWidget, findsOneWidget);
    });

    testWidgets('Game List Page Content Success State Grid View Layout - Empty List', (WidgetTester tester) async {
      // find
      var testedWidget = gridviewLayout(ScrollController(), []);
      final gridViewKeyWidget = find.byKey(const Key("Game List Content Component GridView"));
      final inkWellWidget = find.byKey(const Key("Game List Content GridView Component InkWell"));

      await tester.pumpWidget(parentWidget(testedWidget, mockGameListPageBloc));

      expect(gridViewKeyWidget, findsOneWidget);
      expect(inkWellWidget, findsNothing);
    });

    testWidgets('Game List Page Content Success State Grid View Layout - Non-empty List', (WidgetTester tester) async {
      // find
      var testedWidget = gridviewLayout(ScrollController(), [const GameListData(), const GameListData()]);
      final gridViewKeyWidget = find.byKey(const Key("Game List Content Component GridView"));
      final inkWellWidget = find.byKey(const Key("Game List Content GridView Component InkWell - 0"));

      await tester.pumpWidget(parentWidget(testedWidget, mockGameListPageBloc));

      expect(gridViewKeyWidget, findsOneWidget);
      expect(inkWellWidget, findsOneWidget);
    });

    testWidgets('Game List Page Content Success State Grid View Layout - Test Tap', (WidgetTester tester) async {
      when(() => mockGameDetailPageBloc.state).thenReturn(
        GameDetailTabState(0), // the desired state
      );

      // find
      var testedWidget = gridviewLayout(ScrollController(), [const GameListData(), const GameListData()]);
      final inkWellWidget = find.byKey(const Key("Game List Content GridView Component InkWell - 0"));

      await tester.pumpWidget(multiBlocParentWidget(testedWidget, providerList));

      // Tap on the InkWell to trigger the navigation.
      await tester.tap(inkWellWidget);

      // Wait for the navigation to complete.
      await tester.pumpAndSettle();

      // Verify that the destination route is displayed.
      expect(find.byType(Scaffold), findsOneWidget);
    });

    testWidgets('Game List Page Content Success State List View Layout', (WidgetTester tester) async {
      // arrange
      when(() => mockGameListPageBloc.state).thenReturn(
        GameListStateSuccess(result: const [], listLayout: ListLayout.listview), // the desired state
      );

      // find
      var testedWidget = GameListContentComponent(
        scrollController: ScrollController(),
      );
      final listViewKeyWidget = find.byKey(const Key("Game List Content Component ListView"));

      await tester.pumpWidget(parentWidget(testedWidget, mockGameListPageBloc));

      expect(listViewKeyWidget, findsOneWidget);
    });

    testWidgets('Game List Page Content Success State List View Layout - Empty List', (WidgetTester tester) async {
      // find
      var testedWidget = listviewLayout(ScrollController(), []);
      final listViewKeyWidget = find.byKey(const Key("Game List Content Component ListView"));
      final inkWellWidget = find.byKey(const Key("Game List Content Component InkWell"));

      await tester.pumpWidget(parentWidget(testedWidget, mockGameListPageBloc));

      expect(listViewKeyWidget, findsOneWidget);
      expect(inkWellWidget, findsNothing);
    });

    testWidgets('Game List Page Content Success State List View Layout - Non-empty List', (WidgetTester tester) async {
      // find
      var testedWidget = listviewLayout(ScrollController(), [const GameListData(), const GameListData()]);
      final listViewKeyWidget = find.byKey(const Key("Game List Content Component ListView"));
      final inkWellWidget = find.byKey(const Key("Game List Content Component InkWell - 0"));

      await tester.pumpWidget(parentWidget(testedWidget, mockGameListPageBloc));

      expect(listViewKeyWidget, findsOneWidget);
      expect(inkWellWidget, findsOneWidget);
    });

    testWidgets('Game List Page Content Success State Grid View Layout - Test Tap', (WidgetTester tester) async {
      when(() => mockGameDetailPageBloc.state).thenReturn(
        GameDetailTabState(0), // the desired state
      );

      // find
      var testedWidget = listviewLayout(ScrollController(), [const GameListData(), const GameListData()]);
      final inkWellWidget = find.byKey(const Key("Game List Content Component InkWell - 0"));

      await tester.pumpWidget(multiBlocParentWidget(testedWidget, providerList));

      // Tap on the InkWell to trigger the navigation.
      await tester.tap(inkWellWidget);

      // Wait for the navigation to complete.
      await tester.pumpAndSettle();

      // Verify that the destination route is displayed.
      expect(find.byType(Scaffold), findsOneWidget);
    });

    testWidgets('Game List Page Content Error State', (WidgetTester tester) async {
      // arrange
      when(() => mockGameListPageBloc.state).thenReturn(
        GameListStateError(error: ''), // the desired state
      );

      // find
      var testedWidget = GameListContentComponent(
        scrollController: ScrollController(),
      );
      final errorWidget = find.byType(Center);

      await tester.pumpWidget(parentWidget(testedWidget, mockGameListPageBloc));

      expect(errorWidget, findsOneWidget);
    });

    testWidgets('Game List Page Content Error State Not Found', (WidgetTester tester) async {
      // arrange
      when(() => mockGameListPageBloc.state).thenReturn(
        GameListStateLoadMore(), // the desired state
      );

      // find
      var testedWidget = GameListContentComponent(
        scrollController: ScrollController(),
      );
      final errorWidget = find.byKey(const Key("Game List Content Component State Not Found"));

      await tester.pumpWidget(parentWidget(testedWidget, mockGameListPageBloc));

      expect(errorWidget, findsOneWidget);
    });

    testWidgets('Game List Page Load More State', (WidgetTester tester) async {
      // arrange
      when(() => mockGameListPageBloc.state).thenReturn(
        GameListStateLoadMore(), // the desired state
      );

      // find
      var testedWidget = const GameListLoadMoreComponent();
      final refreshProgressWidget = find.byType(RefreshProgressIndicator);

      await tester.pumpWidget(parentWidget(testedWidget, mockGameListPageBloc));

      expect(refreshProgressWidget, findsOneWidget);
    });

    testWidgets('Game List Page Load More Error State Not Found', (WidgetTester tester) async {
      // arrange
      when(() => mockGameListPageBloc.state).thenReturn(
        GameListStateError(error: ''), // the desired state
      );

      // find
      var testedWidget = const GameListLoadMoreComponent();
      final defWidgetWidget = find.byKey(const Key("Game List Load More Component State Default Widget"));

      await tester.pumpWidget(parentWidget(testedWidget, mockGameListPageBloc));

      expect(defWidgetWidget, findsOneWidget);
    });
  });

  tearDown(() {
    mockGameListPageBloc.close();
  });
}

parentWidget(Widget body, MockGameListPageBloc bloc) => ScreenUtilInit(
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
          onGenerateRoute: initRouter,
          home: BlocProvider<GameListBloc>(
            create: (context) => bloc,
            child: Scaffold(body: body),
          ),
        );
      },
    );

multiBlocParentWidget(Widget body, dynamic providerList) => MultiBlocProvider(
      providers: providerList,
      child: ScreenUtilInit(
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
            onGenerateRoute: initRouter,
            home: Scaffold(body: body),
          );
        },
      ),
    );
