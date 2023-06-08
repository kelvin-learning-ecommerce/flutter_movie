import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../network/base_service.dart';

@module
abstract class AppModule {
  @lazySingleton
  Dio get dio => buildDio();
}
