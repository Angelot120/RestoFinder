import 'package:restofinder/domain/entities/Dish.dart';
import 'package:restofinder/domain/repositories/dish_repository.dart';

class GetDishUseCase {
  final DishRepository repository;

  GetDishUseCase(this.repository);

  Future<Dish> execute(int dishId) {
    return repository.getDish(dishId);
  }
}
