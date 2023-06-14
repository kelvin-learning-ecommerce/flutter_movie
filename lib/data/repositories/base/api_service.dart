import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../utils/resources/env.dart';
import '../../../config/network/app_interceptor.dart';

abstract class ApiService {
  Future<dynamic> fetchGameList({String? url, int? page = 1, int? pageSize = 20});

  Future<dynamic> fetchGameDetail(int code);
}

@Injectable(as: ApiService)
class ApiServiceImpl implements ApiService {
  ApiServiceImpl({required this.dio});

  final Dio dio;

  Future<Response<dynamic>?> _get(String url, {Map<String, dynamic>? queryParameters}) async {
    return await dio.get(url, queryParameters: queryParameters);
  }

  @override
  Future<dynamic> fetchGameList({String? url, int? page = 1, int? pageSize = 20}) async {
    try {
      Response<dynamic>? response = await _get(url ?? "", queryParameters: {
        "page": page,
        "page_size": pageSize,
        "platforms": '187',
        "ordering": "-released",
        "key": "02ef6ba5d13444ee86bad607e8bce3f4",
        "dates": "2018-12-21,2021-12-21"
      });

      return response?.data;
    } on DioException {
      throw DioException;
    }
  }

  @override
  Future<dynamic> fetchGameDetail(int code) async {
    try {
      Response<dynamic>? response =
          await _get("/$code", queryParameters: {"key": "02ef6ba5d13444ee86bad607e8bce3f4"});

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
