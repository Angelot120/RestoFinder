import 'package:restofinder/core/resources/data_state.dart';
import 'package:restofinder/core/usecases/use_case.dart';
import 'package:restofinder/domain/entities/Dish.dart';
import 'package:restofinder/domain/repositories/dish_repository.dart';

class GetDishesByRestaurantUseCase
    implements UseCase<DataState<List<Dish>>, int> {
  final DishRepository repository;

  GetDishesByRestaurantUseCase(this.repository);

  @override
  Future<DataState<List<Dish>>> call(int restaurantId) {
    return repository.getDishesByRestaurant(restaurantId);
  }
}
