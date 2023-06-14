import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../data/repositories/base/api_service.dart';

@module
abstract class AppModule {
  @lazySingleton
  Dio get dio => buildDio();
}
