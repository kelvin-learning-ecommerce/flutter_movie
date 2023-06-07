import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../DI/di_locator.dart';
import '../config/env.dart';
import 'app_interceptor.dart';

var baseService = locator<BaseService>();

abstract class BaseService {
  Future<dynamic> fetchGameList();
}

@injectable
class BaseServiceImp implements BaseService {
  BaseServiceImp(this._dio);

  final Dio _dio;

  Future<Response<String>?> _get(String url, {Map<String, dynamic>? queryParameters}) async {
    return await _dio.get(url, queryParameters: queryParameters);
  }

  Future<Response<String>?> _post(String url, {dynamic data, Options? options}) async {
    return await _dio.post(url, data: data, options: options);
  }

  @override
  Future<dynamic> fetchGameList() async {
    try {
      Response<String>? response = await _get('url');

      return response;
    } on DioException {
      throw DioException;
    }
  }
}

Future<Dio> buildDio() async {
  var dio = Dio();

  dio.interceptors.add(DioInterceptors());
  dio.interceptors.add(NetworkInterceptors(dio));

  // dio.options.headers['Authorization'] = 'Bearer ''$token';

  dio.options.baseUrl = "${Env.data.apiUrl}/api/v1/";
  dio.options.contentType = Headers.jsonContentType;
  dio.options.connectTimeout = const Duration(minutes: 10);
  dio.options.receiveTimeout = const Duration(minutes: 10);
  dio.options.sendTimeout = const Duration(minutes: 10);

  return dio;
}
