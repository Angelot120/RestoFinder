import 'package:dartz/dartz.dart';
import 'package:restofinder/core/resources/data_state.dart';
import 'package:restofinder/domain/entities/Restaurant.dart';

abstract class RestaurantRepository {
  /// Récupère un restaurant spécifique à partir de son ID.
  Future<Either<DataState, Restaurant>> getRestaurant(int id);

  /// Récupère les restaurants à proximité selon la latitude, longitude et rayon.
  Future<Either<DataState, List<Restaurant>>> getNearbyRestaurants(
      double latitude, double longitude, double radius);
}
