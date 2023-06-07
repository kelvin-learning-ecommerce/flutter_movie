import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di_locator.config.dart';

GetIt locator = GetIt.I;

@InjectableInit()
void configureDependencies() async => $initGetIt(locator);