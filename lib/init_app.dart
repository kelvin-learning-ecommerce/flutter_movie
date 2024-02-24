import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magnus_flutter_kelvin_prayitno/utils/resources/env.dart';

import 'config/DI/di_locator.dart';
import 'config/router/navigation_config.dart';
import 'config/router/routes.dart';
import 'modules/locale/bloc/locale_bloc.dart';
import 'modules/locale/states/locale_state.dart';
import 'modules/splashscreen/ui/splash_view.dart';
import 'utils/constants/provider_list.dart';
import 'generated/l10n.dart';

void initApp(EnvType env) async {
  WidgetsFlutterBinding.ensureInitialized();
  Env.init(env);

  await configureDependencies();

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
            builder: (BuildContext context, Widget? child) => BlocBuilder<LocaleBloc, LocaleState>(
                  buildWhen: (prev, state) => state is LocaleStateLoading || state is LocaleStateChangeLocale,
                  builder: (context, state) {
                    var countryCode = 'en';
                    if (state is LocaleStateChangeLocale) {
                      countryCode = state.locale?.countryCode ?? "en";
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
                      title: Env.data.title,
                      navigatorKey: navigationService.navigatorKey,
                      theme: ThemeData(
                        primarySwatch: Colors.blue,
                      ),
                      onGenerateRoute: initRouter,
                      home: const SplashScreen(),
                    );
                  },
                )));
  }
}
