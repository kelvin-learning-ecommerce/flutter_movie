import 'package:flutter/material.dart';
import 'package:flutter_coding_challenge/module/list/view/game_list_view.dart';

const String gameListRoutes = '/GameList';

Route<dynamic> initRouter(RouteSettings settings) {
  switch (settings.name) {
    case gameListRoutes:
      return MaterialPageRoute(builder: (context) => const GameListView(), settings: const RouteSettings());
    default:
      return MaterialPageRoute(builder: (context) => const GameListView(), settings: const RouteSettings());
  }
}