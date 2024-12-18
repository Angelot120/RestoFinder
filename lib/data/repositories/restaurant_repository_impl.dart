import 'package:dartz/dartz.dart';
import 'package:restofinder/core/errors/failure.dart';
import 'package:restofinder/data/datasources/restaurant_remote_data_source.dart';
import 'package:restofinder/data/models/restaurant_model.dart';
import 'package:restofinder/domain/entities/Restaurant.dart';
import 'package:restofinder/domain/repositories/restaurant_repository.dart';

class RestaurantRepositoryImpl implements RestaurantRepository {
  final RestaurantRemoteDataSource remoteDataSource;

  RestaurantRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, Restaurant>> getRestaurant(int id) async {
    try {
      final data = await remoteDataSource.getRestaurant(id);
      return Right(RestaurantModel.fromJson(data));
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Restaurant>>> getNearbyRestaurants(
      double latitude, double longitude, double radius) async {
    try {
      final data = await remoteDataSource.getNearbyRestaurants(
          latitude, longitude, radius);
      return Right(data.map((json) => RestaurantModel.fromJson(json)).toList());
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}

// class RestaurantRepositoryImpl implements RestaurantRepository {
//   final RestaurantRemoteDataSource remoteDataSource;

//   RestaurantRepositoryImpl(this.remoteDataSource);

//   @override
//   Future<Restaurant> getRestaurant(int id) async {
//     final data = await remoteDataSource.getRestaurant(id);
//     return RestaurantModel.fromJson(data);
//   }

//   @override
//   Future<List<Restaurant>> getNearbyRestaurants(
//       double latitude, double longitude, double radius) async {
//     final data =
//         await remoteDataSource.getNearbyRestaurants(latitude, longitude, radius);
//     return data.map((json) => RestaurantModel.fromJson(json)).toList();
//   }
// }
