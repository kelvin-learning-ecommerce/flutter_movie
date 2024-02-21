import 'dart:ffi';

import '../models/response/news_response.dart';

abstract class StorageRepository {
  Future<void> storeIsLogin(bool isLogin);

  Future<bool> getIsLogin();
}
