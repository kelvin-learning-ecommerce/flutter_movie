import 'package:floor/floor.dart';
import 'package:magnus_flutter_kelvin_prayitno/config/floor/user_dao.dart';
import 'package:magnus_flutter_kelvin_prayitno/domain/models/entity/user_entity.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'floor_database.g.dart';

@Database(version: 1, entities: [UserEntity])
abstract class AppDatabase extends FloorDatabase {
  UserDao get userDao;
}
