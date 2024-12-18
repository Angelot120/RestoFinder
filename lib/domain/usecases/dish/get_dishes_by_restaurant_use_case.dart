import 'package:restofinder/domain/entities/Dish.dart';
import 'package:restofinder/domain/repositories/dish_repository.dart';

class GetDishesByRestaurantUseCase {
  final DishRepository repository;

  GetDishesByRestaurantUseCase(this.repository);

  Future<List<Dish>> execute(int restaurantId) {
    return repository.getDishesByRestaurant(restaurantId);
  }
}
