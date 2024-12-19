import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
// import 'package:restofinder/core/errors/failure.dart';
import 'package:restofinder/core/resources/data_state.dart';
import 'package:restofinder/data/datasources/restaurant_remote_data_source.dart';
import 'package:restofinder/data/models/restaurant_model.dart';
import 'package:restofinder/domain/entities/Restaurant.dart';
import 'package:restofinder/domain/repositories/restaurant_repository.dart';

class RestaurantRepositoryImpl implements RestaurantRepository {
  final RestaurantRemoteDataSource remoteDataSource;

  RestaurantRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<DataState, Restaurant>> getRestaurant(int id) async {
    try {
      final data = await remoteDataSource.getRestaurant(id);
      return Right(RestaurantModel.fromJson(data));
    } catch (e) {
      // return Left(DataFailed(DioError(error: e.toString(), type: DioErrorType.other)));
      print(e);

      // Si l'erreur est déjà de type DioError, l'utiliser directement
      if (e is DioError) {
        return Left(DataFailed(e)); // Passer directement l'exception DioError
      }

      // Sinon, créer une DioError générique si l'exception n'est pas DioError
      return Left(DataFailed(DioError(
        error: e.toString(),
        // type: DioErrorType.other,
        requestOptions: RequestOptions(
            path: ''), // Une valeur par défaut pour `requestOptions`
      )));
    }
  }

  @override
  Future<Either<DataState, List<Restaurant>>> getNearbyRestaurants(
      double latitude, double longitude, double radius) async {
    try {
      final data = await remoteDataSource.getNearbyRestaurants(
          latitude, longitude, radius);
      return Right(data.map((json) => RestaurantModel.fromJson(json)).toList());
    } catch (e) {
      // return Left(DataFailed(DioError(error: e.toString(), type: DioErrorType.other)));
      print(e);

      // Si l'erreur est déjà de type DioError, l'utiliser directement
      if (e is DioError) {
        return Left(DataFailed(e)); // Passer directement l'exception DioError
      }

      // Sinon, créer une DioError générique si l'exception n'est pas DioError
      return Left(DataFailed(DioError(
        error: e.toString(),
        // type: DioErrorType.other,
        requestOptions: RequestOptions(
            path: ''), // Une valeur par défaut pour `requestOptions`
      )));
    }
  }
}
