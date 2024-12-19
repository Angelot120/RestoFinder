import 'package:restofinder/core/resources/data_state.dart';
import 'package:restofinder/domain/entities/Dish.dart';
import 'package:restofinder/domain/repositories/dish_repository.dart';

class GetDishUseCase {
  final DishRepository repository;

  GetDishUseCase(this.repository);

  Future<DataState<Dish>> call(int id) {
    return repository.getDish(id, 'YOUR_API_KEY');
  }
}
