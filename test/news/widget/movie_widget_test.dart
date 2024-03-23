import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:magnus_flutter_kelvin_prayitno/config/DI/di_locator.dart';
import 'package:magnus_flutter_kelvin_prayitno/config/router/routes.dart';
import 'package:magnus_flutter_kelvin_prayitno/domain/models/response/movie_response.dart';
import 'package:magnus_flutter_kelvin_prayitno/features/locale/bloc/locale_bloc.dart';
import 'package:magnus_flutter_kelvin_prayitno/features/locale/events/locale_event.dart';
import 'package:magnus_flutter_kelvin_prayitno/features/locale/states/locale_state.dart';
import 'package:magnus_flutter_kelvin_prayitno/features/movie/bloc/movie_bloc.dart';
import 'package:magnus_flutter_kelvin_prayitno/features/movie/events/movie_event.dart';
import 'package:magnus_flutter_kelvin_prayitno/features/movie/states/movie_state.dart';
import 'package:magnus_flutter_kelvin_prayitno/features/movie/ui/components/movie_content_component.dart';
import 'package:magnus_flutter_kelvin_prayitno/features/movie/ui/components/movie_view_ext.dart';
import 'package:magnus_flutter_kelvin_prayitno/features/movie/ui/movie_view.dart';
import 'package:magnus_flutter_kelvin_prayitno/features/moviedetail/bloc/movie_detail_bloc.dart';
import 'package:magnus_flutter_kelvin_prayitno/features/moviedetail/events/movie_detail_event.dart';
import 'package:magnus_flutter_kelvin_prayitno/features/moviedetail/states/movie_detail_state.dart';
import 'package:magnus_flutter_kelvin_prayitno/generated/l10n.dart';
import 'package:magnus_flutter_kelvin_prayitno/utils/constants/key_label.dart';
import 'package:mocktail/mocktail.dart';

class MockMovieBloc extends MockBloc<MovieEvent, MovieState> implements MovieBloc {}

class MockMovieDetailBloc extends MockBloc<MovieDetailEvent, MovieDetailState> implements MovieDetailBloc {}

class MockLocaleBloc extends MockBloc<LocaleEvent, LocaleState> implements LocaleBloc {}

void main() {
  late MockMovieBloc mockMovieBloc;
  late MockMovieDetailBloc mockMovieDetailBloc;
  late MockLocaleBloc mockLocaleBloc;

  late dynamic providerList;

  group("Widget Test", () {
    setUpAll(() async {
      mockMovieBloc = MockMovieBloc();
      mockMovieDetailBloc = MockMovieDetailBloc();
      mockLocaleBloc = MockLocaleBloc();

      providerList = [
        BlocProvider<MovieBloc>(
          create: (context) => mockMovieBloc,
        ),
        BlocProvider<MovieDetailBloc>(
          create: (context) => mockMovieDetailBloc,
        ),
        BlocProvider<LocaleBloc>(
          create: (context) => mockLocaleBloc,
        ),
      ];

      await configureDependencies();
      TestWidgetsFlutterBinding.ensureInitialized();
    });

    testWidgets('Movie View Widget Test - Parent Widget', (WidgetTester tester) async {
      when(() => mockLocaleBloc.state).thenReturn(
        LocaleStateChangeLocale(), // the desired state
      );

      when(() => mockMovieBloc.state).thenReturn(
        MovieStateLoading(), // the desired state
      );

      // find
      var testedWidget = const MovieView();
      final inkWellWidget = find.byKey(movieParent);

      await tester.pumpWidget(multiBlocParentWidget(testedWidget, providerList));
      expect(inkWellWidget, findsOneWidget);
    });

    testWidgets('Movie Page Content Loading State', (WidgetTester tester) async {
      // arrange
      when(() => mockMovieBloc.state).thenReturn(
        MovieStateLoading(), // the desired state
      );

      // find
      var testedWidget = const MovieContentComponent();
      final refreshProgressWidget = find.byType(RefreshProgressIndicator);

      await tester.pumpWidget(parentWidget(testedWidget, mockMovieBloc));

      expect(refreshProgressWidget, findsOneWidget);
    });

    testWidgets('Movie Page Content Success State Grid View Layout', (WidgetTester tester) async {
      // arrange
      when(() => mockMovieBloc.state).thenReturn(
        MovieStateSuccess(result: const [], listLayout: ListLayout.gridview), // the desired state
      );

      // find
      var testedWidget = const MovieContentComponent();
      final gridViewKeyWidget = find.byKey(movieContentGridViewParent);

      await tester.pumpWidget(parentWidget(testedWidget, mockMovieBloc));

      expect(gridViewKeyWidget, findsOneWidget);
    });

    testWidgets('Movie Page Content Success State Grid View Layout - Empty List', (WidgetTester tester) async {
      // find
      var testedWidget = gridviewLayout([]);
      final gridViewKeyWidget = find.byKey(movieContentGridViewParent);
      final inkWellWidget = find.byKey(const Key("$movieContentGridViewInkWellParentKeyLabel - 0"));

      await tester.pumpWidget(parentWidget(testedWidget, mockMovieBloc));

      expect(gridViewKeyWidget, findsOneWidget);
      expect(inkWellWidget, findsNothing);
    });

    testWidgets('Movie Page Content Success State Grid View Layout - Non-empty List', (WidgetTester tester) async {
      // find
      var testedWidget = gridviewLayout([MovieResultResponse(), MovieResultResponse()]);
      final gridViewKeyWidget = find.byKey(movieContentGridViewParent);
      final inkWellWidget = find.byKey(const Key("$movieContentGridViewInkWellParentKeyLabel - 0"));

      await tester.pumpWidget(parentWidget(testedWidget, mockMovieBloc));

      expect(gridViewKeyWidget, findsOneWidget);
      expect(inkWellWidget, findsOneWidget);
    });

    testWidgets('Movie Page Content Success State List View Layout', (WidgetTester tester) async {
      // arrange
      when(() => mockMovieBloc.state).thenReturn(
        MovieStateSuccess(result: const [], listLayout: ListLayout.listview), // the desired state
      );

      // find
      var testedWidget = const MovieContentComponent();
      final listViewKeyWidget = find.byKey(movieContentListViewParentKey);

      await tester.pumpWidget(parentWidget(testedWidget, mockMovieBloc));

      expect(listViewKeyWidget, findsOneWidget);
    });

    testWidgets('Movie Page Content Success State List View Layout - Empty List', (WidgetTester tester) async {
      // find
      var testedWidget = listviewLayout([]);
      final listViewKeyWidget = find.byKey(movieContentListViewParentKey);
      final inkWellWidget = find.byKey(const Key("$movieContentListViewInkwellParentKey - 0"));

      await tester.pumpWidget(parentWidget(testedWidget, mockMovieBloc));

      expect(listViewKeyWidget, findsOneWidget);
      expect(inkWellWidget, findsNothing);
    });

    testWidgets('Movie Page Content Success State List View Layout - Non-empty List', (WidgetTester tester) async {
      // find
      var testedWidget = listviewLayout([MovieResultResponse(), MovieResultResponse()]);
      final listViewKeyWidget = find.byKey(movieContentListViewParentKey);
      final inkWellWidget = find.byKey(const Key("$movieContentListViewInkwellParentKey - 0"));

      await tester.pumpWidget(parentWidget(testedWidget, mockMovieBloc));

      expect(listViewKeyWidget, findsOneWidget);
      expect(inkWellWidget, findsOneWidget);
    });
  });
}

parentWidget(Widget body, MockMovieBloc bloc) => ScreenUtilInit(
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
          home: BlocProvider<MovieBloc>(
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
