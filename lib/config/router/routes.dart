import 'package:flutter/material.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/home/ui/home_view.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/login/ui/login_view.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/register/ui/register_view.dart';

import '../../domain/models/response/news_response.dart';
import '../../modules/newsdetail/ui/news_detail_view.dart';

const String homeRoutes = '/HomeRoutes';
const String registerRoutes = '/RegisterRoutes';
const String newsDetailRoutes = '/NewsDetailRoutes';
const String loginRoutes = '/LoginRoutes';
const String splashRoutes = '/SplashRoutes';

Route<dynamic> initRouter(RouteSettings settings) {
  switch (settings.name) {
    case newsDetailRoutes:
      return MaterialPageRoute(
          builder: (context) => NewsDetailView(
                args: settings.arguments as NewsArticles,
              ),
          settings: const RouteSettings());
    case registerRoutes:
      return MaterialPageRoute(builder: (context) => const RegisterView(), settings: const RouteSettings());
    case homeRoutes:
      return MaterialPageRoute(builder: (context) => const HomeView(), settings: const RouteSettings());
    default:
      return MaterialPageRoute(builder: (context) => const LoginView(), settings: const RouteSettings());
  }
}
