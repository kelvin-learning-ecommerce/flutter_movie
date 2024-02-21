// entity/person.dart

import 'package:floor/floor.dart';
import 'package:magnus_flutter_kelvin_prayitno/utils/constants/floor_db_const.dart';

@Entity(tableName: userTable)
class UserEntity {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  final String username;
  final String password;
  final String phoneNo;
  final String name;

  UserEntity({
    this.id,
    required this.name,
    required this.password,
    required this.username,
    required this.phoneNo,
  });
}
