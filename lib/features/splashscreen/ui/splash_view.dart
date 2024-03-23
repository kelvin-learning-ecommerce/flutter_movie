import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magnus_flutter_kelvin_prayitno/utils/extensions/routes_ext.dart';

import '../../../utils/constants/image_path.dart';
import '../bloc/splash_screen_bloc.dart';
import '../events/splash_screen_event.dart';
import '../states/splash_screen_state.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () => splashScreenBloc?.add(const SplashScreenNextPageEvent()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashScreenBloc, SplashScreenState>(
        listener: (BuildContext context, state) {
          if (state is SplashScreenStateSuccess) {
            context.goToHome();
          }
        },
        child: Center(
          child: Image.asset(movieIc),
        ),
      ),
    );
  }
}
