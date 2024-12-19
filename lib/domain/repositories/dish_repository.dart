import 'package:restofinder/core/resources/data_state.dart';
import 'package:restofinder/domain/entities/Dish.dart';

abstract class DishRepository {
  /// Récupère un plat spécifique à partir de son ID.
  Future<DataState<Dish>> getDish(int id, String apiKey);

  /// Récupère la liste des plats d'un restaurant par son ID.
  Future<DataState<List<Dish>>> getDishesByRestaurant(int restaurantId);
}
