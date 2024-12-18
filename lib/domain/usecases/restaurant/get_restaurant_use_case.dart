import 'package:dartz/dartz.dart';
import 'package:restofinder/core/errors/failure.dart';
import 'package:restofinder/domain/entities/Restaurant.dart';
import 'package:restofinder/domain/repositories/restaurant_repository.dart';

class GetRestaurantUseCase {
  final RestaurantRepository repository;

  GetRestaurantUseCase(this.repository);

  // Future<Restaurant> execute(int restaurantId) {
  //   return repository.getRestaurant(restaurantId);
  // }

  Future<Either<Failure, Restaurant>> execute(int restaurantId) {
    return repository.getRestaurant(restaurantId);
  }
}
