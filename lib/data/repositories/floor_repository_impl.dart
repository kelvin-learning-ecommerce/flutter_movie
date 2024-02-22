import 'package:injectable/injectable.dart';
import 'package:magnus_flutter_kelvin_prayitno/config/floor/floor_database.dart';
import 'package:magnus_flutter_kelvin_prayitno/domain/models/entity/user_entity.dart';

import '../../domain/repositories/floor_repository.dart';

@Injectable(as: FloorRepository)
class FloorRepositoryImpl implements FloorRepository {
  FloorRepositoryImpl({required this.sqlDB});

  final AppDatabase sqlDB;

  // @override
  // Stream<UserEntity?> findUser(String username) {
  //   final userDao = sqlDB.userDao;
  //   return userDao.findUser(username);
  // }

  @override
  Future<void> insertNewUser(UserEntity user) async {
    var personDao = sqlDB.userDao;

    await personDao.insertNewUser(user);
  }

  @override
  Future<UserEntity?> findUser(String username) {
    final userDao = sqlDB.userDao;
    return userDao.findUser(username);
  }
}
