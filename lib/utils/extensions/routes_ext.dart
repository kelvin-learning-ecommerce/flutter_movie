import 'package:flutter/material.dart';

import '../../config/router/routes.dart';

extension Navigation on BuildContext {
  Future<dynamic> goToDetail(args) => Navigator.pushNamed(this, gameDetailRoutes, arguments: args);
}
