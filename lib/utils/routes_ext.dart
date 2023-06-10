import 'package:flutter/material.dart';

import '../config/routes.dart';

extension Navigation on BuildContext {
  Future<dynamic> goToDetail(args) => Navigator.pushNamed(this, gameDetailRoutes, arguments: args);
}
