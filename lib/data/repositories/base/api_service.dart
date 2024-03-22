import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../utils/resources/env.dart';
import '../../../config/network/app_interceptor.dart';

abstract class ApiService {
  Future<dynamic> fetchMovie({String? q, int? id});
}

@Injectable(as: ApiService)
class ApiServiceImpl implements ApiService {
  ApiServiceImpl({required this.dio});

  final Dio dio;

  Future<Response<dynamic>?> _get(String url, {Map<String, dynamic>? queryParameters}) async {
    return await dio.get(url, queryParameters: queryParameters);
  }

  @override
  Future fetchMovie({String? q, int? id}) async {
    try {
      Response<dynamic>? response = await _get("films/${id == null ? "" : "$id/"}", queryParameters: {
        "q": q,
      });

      return response?.data;
    } on DioException {
      throw DioException;
    }
  }
}

Dio buildDio() {
  var dio = Dio();

  assert(() {
    dio.interceptors.add(DioInterceptors());
    return true;
  }());

  dio.interceptors.add(NetworkInterceptors(dio));

  dio.options.baseUrl = Env.data.apiUrl;
  dio.options.contentType = Headers.jsonContentType;
  dio.options.connectTimeout = const Duration(minutes: 10);
  dio.options.receiveTimeout = const Duration(minutes: 10);
  dio.options.sendTimeout = const Duration(minutes: 10);

  return dio;
}
