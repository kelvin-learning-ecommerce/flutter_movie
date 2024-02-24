import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:magnus_flutter_kelvin_prayitno/config/DI/di_locator.dart';
import 'package:magnus_flutter_kelvin_prayitno/config/router/routes.dart';
import 'package:magnus_flutter_kelvin_prayitno/domain/models/response/news_response.dart';
import 'package:magnus_flutter_kelvin_prayitno/generated/l10n.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/locale/bloc/locale_bloc.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/locale/events/locale_event.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/locale/states/locale_state.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/news/bloc/news_bloc.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/news/events/news_event.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/news/states/news_state.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/news/ui/components/news_content_component.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/news/ui/components/news_view_ext.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/news/ui/news_view.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/newsdetail/bloc/news_detail_bloc.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/newsdetail/events/news_detail_event.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/newsdetail/states/news_detail_state.dart';
import 'package:mocktail/mocktail.dart';

class MockNewsBloc extends MockBloc<NewsEvent, NewsState> implements NewsBloc {}

class MockNewsDetailBloc extends MockBloc<NewsDetailEvent, NewsDetailState> implements NewsDetailBloc {}

class MockLocaleBloc extends MockBloc<LocaleEvent, LocaleState> implements LocaleBloc {}

void main() {
  late MockNewsBloc mockNewsBloc;
  late MockNewsDetailBloc mockNewsDetailBloc;
  late MockLocaleBloc mockLocaleBloc;

  late dynamic providerList;

  group("Login View Widget Test", () {
    setUpAll(() async {
      mockNewsBloc = MockNewsBloc();
      mockNewsDetailBloc = MockNewsDetailBloc();
      mockLocaleBloc = MockLocaleBloc();

      providerList = [
        BlocProvider<NewsBloc>(
          create: (context) => mockNewsBloc,
        ),
        BlocProvider<NewsDetailBloc>(
          create: (context) => mockNewsDetailBloc,
        ),
        BlocProvider<LocaleBloc>(
          create: (context) => mockLocaleBloc,
        ),
      ];

      await configureDependencies();
      TestWidgetsFlutterBinding.ensureInitialized();
    });

    testWidgets('News View Widget Test - Parent Widget', (WidgetTester tester) async {
      when(() => mockLocaleBloc.state).thenReturn(
        LocaleStateChangeLocale(), // the desired state
      );

      when(() => mockNewsBloc.state).thenReturn(
        NewsStateLoading(), // the desired state
      );

      // find
      var testedWidget = const NewsListScreen();
      final inkWellWidget = find.byKey(const Key("News-Parent Column"));

      await tester.pumpWidget(multiBlocParentWidget(testedWidget, providerList));
      expect(inkWellWidget, findsOneWidget);
    });

    testWidgets('News Page Content Loading State', (WidgetTester tester) async {
      // arrange
      when(() => mockNewsBloc.state).thenReturn(
        NewsStateLoading(), // the desired state
      );

      // find
      var testedWidget = NewsContentComponent(
        scrollController: ScrollController(),
      );
      final refreshProgressWidget = find.byType(RefreshProgressIndicator);

      await tester.pumpWidget(parentWidget(testedWidget, mockNewsBloc));

      expect(refreshProgressWidget, findsOneWidget);
    });

    testWidgets('News Page Content Success State Grid View Layout', (WidgetTester tester) async {
      // arrange
      when(() => mockNewsBloc.state).thenReturn(
        NewsStateSuccess(result: const [], listLayout: ListLayout.gridview), // the desired state
      );

      // find
      var testedWidget = NewsContentComponent(
        scrollController: ScrollController(),
      );
      final gridViewKeyWidget = find.byKey(const Key("News Content Component GridView"));

      await tester.pumpWidget(parentWidget(testedWidget, mockNewsBloc));

      expect(gridViewKeyWidget, findsOneWidget);
    });

    testWidgets('News Page Content Success State Grid View Layout - Empty List', (WidgetTester tester) async {
      // find
      var testedWidget = gridviewLayout(ScrollController(), []);
      final gridViewKeyWidget = find.byKey(const Key("News Content Component GridView"));
      final inkWellWidget = find.byKey(const Key("News Content GridView Component InkWell"));

      await tester.pumpWidget(parentWidget(testedWidget, mockNewsBloc));

      expect(gridViewKeyWidget, findsOneWidget);
      expect(inkWellWidget, findsNothing);
    });

    testWidgets('News Page Content Success State Grid View Layout - Non-empty List', (WidgetTester tester) async {
      // find
      var testedWidget = gridviewLayout(ScrollController(), [const NewsArticles(), const NewsArticles()]);
      final gridViewKeyWidget = find.byKey(const Key("News Content Component GridView"));
      final inkWellWidget = find.byKey(const Key("News Content GridView Component InkWell - 0"));

      await tester.pumpWidget(parentWidget(testedWidget, mockNewsBloc));

      expect(gridViewKeyWidget, findsOneWidget);
      expect(inkWellWidget, findsOneWidget);
    });

    testWidgets('News Page Content Success State List View Layout', (WidgetTester tester) async {
      // arrange
      when(() => mockNewsBloc.state).thenReturn(
        NewsStateSuccess(result: const [], listLayout: ListLayout.listview), // the desired state
      );

      // find
      var testedWidget = NewsContentComponent(
        scrollController: ScrollController(),
      );
      final listViewKeyWidget = find.byKey(const Key("News Content Component ListView"));

      await tester.pumpWidget(parentWidget(testedWidget, mockNewsBloc));

      expect(listViewKeyWidget, findsOneWidget);
    });

    testWidgets('News Page Content Success State List View Layout - Empty List', (WidgetTester tester) async {
      // find
      var testedWidget = listviewLayout(ScrollController(), []);
      final listViewKeyWidget = find.byKey(const Key("News Content Component ListView"));
      final inkWellWidget = find.byKey(const Key("News Content Component InkWell"));

      await tester.pumpWidget(parentWidget(testedWidget, mockNewsBloc));

      expect(listViewKeyWidget, findsOneWidget);
      expect(inkWellWidget, findsNothing);
    });

    testWidgets('News Page Content Success State List View Layout - Non-empty List', (WidgetTester tester) async {
      // find
      var testedWidget = listviewLayout(ScrollController(), [const NewsArticles(), const NewsArticles()]);
      final listViewKeyWidget = find.byKey(const Key("News Content Component ListView"));
      final inkWellWidget = find.byKey(const Key("News Content ListView Component InkWell - 0"));

      await tester.pumpWidget(parentWidget(testedWidget, mockNewsBloc));

      expect(listViewKeyWidget, findsOneWidget);
      expect(inkWellWidget, findsOneWidget);
    });
  });
}

parentWidget(Widget body, MockNewsBloc bloc) => ScreenUtilInit(
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
          home: BlocProvider<NewsBloc>(
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
