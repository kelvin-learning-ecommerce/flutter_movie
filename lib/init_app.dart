import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_coding_challenge/module/list/view/game_list_view.dart';
import 'package:flutter_coding_challenge/module/locale/bloc/locale_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'DI/di_locator.dart';
import 'config/env.dart';
import 'config/navigation_config.dart';
import 'config/provider_list.dart';
import 'config/routes.dart';
import 'generated/l10n.dart';
import 'module/locale/state/locale_state.dart';

void initApp(EnvType env) async {
  WidgetsFlutterBinding.ensureInitialized();
  Env.init(env);

  configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: providerList,
        child: ScreenUtilInit(
            minTextAdapt: true,
            builder: (BuildContext context, Widget? child) =>
                BlocBuilder<LocaleBloc, LocaleState>(
                  buildWhen: (prev, state) => state is LocaleStateLoading || state is LocaleStateChangeLocale,
                  builder: (context, state) {
                    var countryCode = 'en';
                    if (state is LocaleStateChangeLocale) {
                      countryCode = langModel?.currLang.countryCode ?? 'en';
                    }

                    return MaterialApp(
                      localizationsDelegates: const [
                        S.delegate,
                        GlobalMaterialLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate,
                        GlobalCupertinoLocalizations.delegate,
                      ],
                      supportedLocales: AppLocalizations.supportedLocales,
                      locale: Locale(
                        countryCode,
                      ),
                      debugShowCheckedModeBanner: kDebugMode,
                      title: Env.data.title,
                      navigatorKey: navigationService.navigatorKey,
                      theme: ThemeData(
                        primarySwatch: Colors.blue,
                      ),
                      onGenerateRoute: initRouter,
                      home: const GameListView(),
                    );
                  },
                )
                ));
  }
}
