import 'package:flutter/material.dart';

import '../../config/router/routes.dart';

extension Navigation on BuildContext {
  Future<dynamic> goToDetail(args) => Navigator.pushNamed(this, newsDetailRoutes, arguments: args);

  Future<dynamic> goToHome() => Navigator.pushNamedAndRemoveUntil(this, homeRoutes, (Route<dynamic> route) => false);
}
