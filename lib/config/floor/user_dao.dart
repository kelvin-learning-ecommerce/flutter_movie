import 'package:floor/floor.dart';

import '../../domain/models/entity/user_entity.dart';
import '../../utils/constants/floor_db_const.dart';

@dao
abstract class UserDao {
  @Query('SELECT * FROM $userTable WHERE username = :username')
  // Stream<UserEntity?>
  Future<UserEntity?> findUser(String username);

  @insert
  Future<void> insertNewUser(UserEntity person);
}
