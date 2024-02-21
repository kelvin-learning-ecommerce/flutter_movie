import 'package:floor/floor.dart';

import '../../domain/models/entity/user_entity.dart';

@dao
abstract class UserDao {
  @Query('SELECT * FROM Person WHERE username = :username')
  Stream<UserEntity?> findUser(String username);

  @insert
  Future<void> insertNewUser(UserEntity person);
}
