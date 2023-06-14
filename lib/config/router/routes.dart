import 'package:flutter/material.dart';
import 'package:flutter_coding_challenge/presentation/views/game_detail_view.dart';
import 'package:flutter_coding_challenge/presentation/views/game_list_view.dart';

const String gameListRoutes = '/GameList';
const String gameDetailRoutes = '/GameDetail';

Route<dynamic> initRouter(RouteSettings settings) {
  switch (settings.name) {
    case gameListRoutes:
      return MaterialPageRoute(
          builder: (context) => const GameListView(), settings: const RouteSettings());
    default:
      return MaterialPageRoute(
          builder: (context) => GameDetailView(
                args: settings.arguments,
              ),
          settings: const RouteSettings());
  }
}
