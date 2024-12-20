import 'package:floor/floor.dart';
import 'package:restofinder/data/models/restaurant_model.dart';

@dao
abstract class RestaurantDao {
  @Insert()
  Future<void> insertRestaurant(RestaurantModel restaurant);

  @delete
  Future<void> deleteRestaurant(RestaurantModel restaurant);

  @Query('SELECT * FROM restaurant')
  Future<List<RestaurantModel>> getRestaurant();
}
