import 'package:flutter/material.dart';

import 'config/env.dart';

void initApp(EnvType env) async {
  WidgetsFlutterBinding.ensureInitialized();
  Env.init(env);

  // await configureDependencies();

  // HttpOverrides.global = MyHttpOverrides();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

