import 'package:floor/floor.dart';
import 'package:restofinder/data/datasources/Local/DAO/restaurant_dao.dart';
import 'package:restofinder/data/models/restaurant_model.dart';
// import 'package:sqflite/sqflite.dart';
// import 'dart:async';
// part 'app_database.g.dart';

@Database(version: 1, entities: [RestaurantModel])
abstract class AppDatabase extends FloorDatabase {
  RestaurantDao get restaurantDao;
}
