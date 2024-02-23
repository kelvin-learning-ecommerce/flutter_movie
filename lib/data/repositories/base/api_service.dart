import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../utils/resources/env.dart';
import '../../../config/network/app_interceptor.dart';

abstract class ApiService {
  Future<dynamic> fetchNews({String? url, String? q, required int page});
}

@Injectable(as: ApiService)
class ApiServiceImpl implements ApiService {
  ApiServiceImpl({required this.dio});

  final Dio dio;

  Future<Response<dynamic>?> _get(String url, {Map<String, dynamic>? queryParameters}) async {
    return await dio.get(url, queryParameters: queryParameters);
  }

  @override
  Future fetchNews({String? url, String? q, required int page}) async {
    try {
      Response<dynamic>? response = await _get(url ?? "", queryParameters: {
        "q": q,
        "apikey": "92a2a1bb14fa45bf813474bf76f49355",
        "page": page,
        "pageSize": 10,
      });

      return response?.data;
    } on DioException {
      throw DioException;
    }
  }
}

Dio buildDio() {
  var dio = Dio();

  dio.interceptors.add(DioInterceptors());
  dio.interceptors.add(NetworkInterceptors(dio));

  dio.options.baseUrl = Env.data.apiUrl;
  dio.options.contentType = Headers.jsonContentType;
  dio.options.connectTimeout = const Duration(minutes: 10);
  dio.options.receiveTimeout = const Duration(minutes: 10);
  dio.options.sendTimeout = const Duration(minutes: 10);

  return dio;
}
