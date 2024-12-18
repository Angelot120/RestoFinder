import 'package:restofinder/domain/entities/Dish.dart';

abstract class DishRepository {
  Future<Dish> getDish(int id);
  Future<List<Dish>> getDishesByRestaurant(int restaurantId);
}
