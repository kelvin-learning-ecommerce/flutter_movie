import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../DI/di_locator.dart';

final navigationService = locator<NavigationService>();

@injectable
class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}
