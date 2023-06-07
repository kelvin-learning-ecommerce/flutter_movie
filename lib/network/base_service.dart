import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_coding_challenge/module/list/model/game_list_model.dart';
import 'package:injectable/injectable.dart';

import '../DI/di_locator.dart';

var baseService = locator<BaseService>();

abstract class BaseService{
  Future<dynamic> fetchGameList();
}

@injectable
class BaseServiceImp implements BaseService{
  BaseServiceImp(this._dio);

  final Dio _dio;

  Future<Response<String>?> _get(String url,
      {Map<String, dynamic>? queryParameters}) async {
    return await _dio.get(url, queryParameters: queryParameters);
  }

  Future<Response<String>?> _post(String url,
      {dynamic data, Options? options}) async {
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

  var token = await getLoginToken();

  dio.options.headers['Authorization'] = 'Bearer '
      // 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjQ0LCJtZW1iZXIiOnsiaWQiOjQ0LCJuYW1lIjoidGVzdCIsImVtYWlsIjoibW9iaWxlZGV2QHRlc3RpbmcuY29tIiwicGhvbmVfbnVtYmVyIjoiMTIzNDU2NzgiLCJucmljIjoiMTIzNCIsIm1lbWJlcl90eXBlIjoibWVtYmVyIiwicG9pbnQiOjQ2NTYsInByb2ZpbGVfcGljdHVyZSI6bnVsbCwic3RhdHVzIjoiQWN0aXZlIiwibGFzdF9jaGFuZ2VfcGFzc3dvcmQiOm51bGx9LCJpc3MiOiJodHRwOlwvXC8xNTcuMjMwLjI1NC4yMDRcL2FwaVwvdjFcL2xvZ2luIiwiaWF0IjoxNjUzNzI2MjQ4LCJleHAiOjE2NTM3Mjk4NDgsIm5iZiI6MTY1MzcyNjI0OCwianRpIjoiWGNUaUFiV3IwY3dmdll4RSJ9.cB9BlA1c-BH5BiByyTPaWOhCVSNlSAg_7J388BU6yUA';
      '$token';
  // }

  dio.options.baseUrl = "${Env.data.apiUrl}/api/v1/";
  dio.options.contentType = Headers.jsonContentType;
  dio.options.connectTimeout = 30000;
  dio.options.receiveTimeout = 30000;
  dio.options.sendTimeout = 30000;

  return dio;
}
