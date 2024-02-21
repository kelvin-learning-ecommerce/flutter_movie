
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:magnus_flutter_kelvin_prayitno/domain/repositories/storage_repository.dart';

import '../../utils/constants/storage_const.dart';
import '../../utils/extensions/string_ext.dart';

@Injectable(as: StorageRepository)
class StorageRepositoryImpl implements StorageRepository {
  StorageRepositoryImpl({required this.secureStorage});

  final FlutterSecureStorage secureStorage;

  @override
  Future<bool> getIsLogin() async {
    var res = await secureStorage.read(key: isLoginKey);
    return (res ?? "false").toBool();
  }

  @override
  Future<void> storeIsLogin(bool isLogin) async {
    return await secureStorage.write(key: isLoginKey, value: isLogin.toString());
  }
}
