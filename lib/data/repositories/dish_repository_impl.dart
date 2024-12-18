import 'package:restofinder/data/datasources/dish_remote_data_source.dart';
import 'package:restofinder/domain/entities/Dish.dart';
import 'package:restofinder/domain/repositories/dish_repository.dart';

class DishRepositoryImpl implements DishRepository {
  final DishRemoteDataSource remoteDataSource;

  DishRepositoryImpl(this.remoteDataSource);

  @override
  Future<Dish> getDish(int id) async {
    try {
      return await remoteDataSource.getDish(id);
    } catch (e) {
      throw Exception('Failed to fetch dish');
    }
  }

  @override
  Future<List<Dish>> getDishesByRestaurant(int restaurantId) async {
    try {
      return await remoteDataSource.getDishesByRestaurant(restaurantId);
    } catch (e) {
      throw Exception('Failed to fetch dishes');
    }
  }
}
