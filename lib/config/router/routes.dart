import 'package:flutter/material.dart';

import '../../domain/models/response/movie_response.dart';
import '../../features/home/ui/home_view.dart';
import '../../features/moviedetail/ui/movie_detail_view.dart';

const String homeRoutes = '/HomeRoutes';
const String newsDetailRoutes = '/NewsDetailRoutes';
const String splashRoutes = '/SplashRoutes';

Route<dynamic> initRouter(RouteSettings settings) {
  switch (settings.name) {
    case newsDetailRoutes:
      return MaterialPageRoute(
          builder: (context) => NewsDetailView(
                args: settings.arguments as MovieResultResponse,
              ),
          settings: const RouteSettings());
    default:
      return MaterialPageRoute(builder: (context) => const HomeView(), settings: const RouteSettings());
  }
}
