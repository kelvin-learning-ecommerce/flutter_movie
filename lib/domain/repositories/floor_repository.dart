import '../models/entity/user_entity.dart';

abstract class FloorRepository {
  Stream<UserEntity?> findUser(String username);

  Future<void> insertNewUser(UserEntity person);
}
