import 'package:dartz/dartz.dart';
import 'package:restofinder/core/errors/failure.dart';
import 'package:restofinder/domain/entities/Restaurant.dart';

abstract class RestaurantRepository {
  //   Future<Restaurant> getRestaurant(int id);
  // Future<List<Restaurant>> getNearbyRestaurants(
  //     double latitude, double longitude);

  // Future<Either<Failure, List<Restaurant>>> getNearbyRestaurants(double latitude, double longitude, double d, {
  //   required double latitude,
  //   required double longitude,
  //   required double radius,
  // });

  Future<Either<Failure, Restaurant>> getRestaurant(int id);

  Future<Either<Failure, List<Restaurant>>> getNearbyRestaurants(
    double latitude,
    double longitude,
    double radius,
  );
}
