import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_coding_challenge/module/list/view/game_list_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'DI/di_locator.dart';
import 'config/env.dart';
import 'config/navigation_config.dart';
import 'config/provider_list.dart';
import 'config/routes.dart';

void initApp(EnvType env) async {
  WidgetsFlutterBinding.ensureInitialized();
  Env.init(env);

  configureDependencies();

  // HttpOverrides.global = MyHttpOverrides();

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
            builder: (BuildContext context, Widget? child) => MaterialApp(
                  debugShowCheckedModeBanner: kDebugMode,
                  title: 'Flutter Coding Challenge',
                  navigatorKey: navigationService.navigatorKey,
                  theme: ThemeData(
                    primarySwatch: Colors.blue,
                  ),
                  onGenerateRoute: initRouter,
                  home: const GameListView(),
                )));
  }
}
