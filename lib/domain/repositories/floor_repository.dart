import '../models/entity/user_entity.dart';

abstract class FloorRepository {
  // Stream<UserEntity?>
  Future<UserEntity?> findUser(String username);

  Future<void> insertNewUser(UserEntity user);
}
