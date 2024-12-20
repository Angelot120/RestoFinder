// lib/data/repositories/restaurant_repository.dart

import 'package:dartz/dartz.dart';
import 'package:restofinder/core/resources/data_state.dart';
import 'package:restofinder/data/datasources/restaurant_remote_data_source.dart';
import 'package:restofinder/data/models/restaurant_model.dart';
import 'package:restofinder/domain/entities/Restaurant.dart';
// import 'package:dio/dio.dart';

class RestaurantRepository {
  final RestaurantRemoteDataSource remoteDataSource;

  RestaurantRepository(this.remoteDataSource);

  // Fonction pour récupérer les restaurants proches
// Fonction pour récupérer un restaurant par ID
  Future<Either<DataState, Restaurant>> getRestaurant(int id) async {
    try {
      final data = await remoteDataSource.getRestaurant(id);
      return Right(RestaurantModel.fromJson(
          data)); // On mappe la réponse JSON en objet Restaurant
    } catch (e) {
      // return Left(DataFailed(e));
      print('Error fetching nearby restaurants: $e');
      throw Exception('Failed to load nearby restaurants');
    }
  }

  // Fonction pour récupérer les restaurants à proximité
  Future<Either<DataState, List<Restaurant>>> getNearbyRestaurants(
    double latitude,
    double longitude,
    double radius,
  ) async {
    try {
      final data = await remoteDataSource.getNearbyRestaurants(
          latitude, longitude, radius);
      return Right(data
          .map((json) => RestaurantModel.fromJson(json))
          .toList()); // Liste des restaurants
    } catch (e) {
      print('Error fetching nearby restaurants: $e');
      throw Exception('Failed to load nearby restaurants');
    }
  }
}

// import 'package:dartz/dartz.dart';
// import 'package:restofinder/core/resources/data_state.dart';
// import 'package:restofinder/domain/entities/Restaurant.dart';

// abstract class RestaurantRepository {
//   /// Récupère un restaurant spécifique à partir de son ID.
//   Future<Either<DataState, Restaurant>> getRestaurant(int id);

//   /// Récupère les restaurants à proximité selon la latitude, longitude et rayon.
//   Future<Either<DataState, List<Restaurant>>> getNearbyRestaurants(
//       double latitude, double longitude, double radius);
// }
