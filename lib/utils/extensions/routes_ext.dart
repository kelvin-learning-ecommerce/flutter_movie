import 'package:flutter/material.dart';

import '../../config/router/routes.dart';

extension Navigation on BuildContext {
  Future<dynamic> goToDetail(args) => Navigator.pushNamed(this, newsDetailRoutes, arguments: args);

  Future<dynamic> goToLogin() => Navigator.pushNamed(this, loginRoutes);

  Future<dynamic> backToLogin() =>
      Navigator.pushNamedAndRemoveUntil(this, loginRoutes, (Route<dynamic> route) => false);

  Future<dynamic> goToHome() => Navigator.pushNamedAndRemoveUntil(this, homeRoutes, (Route<dynamic> route) => false);

  Future<dynamic> goToRegister() => Navigator.pushNamed(this, registerRoutes);
}
