import 'package:flutter/material.dart';

import '../../config/router/routes.dart';

extension Navigation on BuildContext {
  Future<dynamic> goToDetail(args) => Navigator.pushNamed(this, newsDetailRoutes, arguments: args);
  Future<dynamic> goToLogin() => Navigator.pushNamed(this, loginRoutes);
  Future<dynamic> goToHome() => Navigator.pushNamed(this, homeRoutes);
}
