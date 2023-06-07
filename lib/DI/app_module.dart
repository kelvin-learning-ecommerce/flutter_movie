import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../network/base_service.dart';

@module
abstract class AppModule {
  @preResolve
  Future<Dio> get dioClient => buildDio();
}
