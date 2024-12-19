import 'dart:io';

import 'package:dio/dio.dart';
import 'package:restofinder/core/constants/constants.dart';
import 'package:restofinder/core/resources/data_state.dart';
import 'package:restofinder/data/datasources/dish_remote_data_source.dart';
import 'package:restofinder/domain/entities/Dish.dart';
import 'package:restofinder/domain/repositories/dish_repository.dart';
// import 'package:retrofit/retrofit.dart';

class DishRepositoryImpl implements DishRepository {
  final DishRemoteDataSource remoteDataSource;

  DishRepositoryImpl(this.remoteDataSource);

  @override
  Future<DataState<Dish>> getDish(int id, String apiKey) async {
    try {
      final httpResponse =
          await remoteDataSource.getDish(id, apiKey: newsApiKey);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioError(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            // type: DioErrorType.response,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<List<Dish>>> getDishesByRestaurant(int restaurantId) async {
    try {
      // return await remoteDataSource.getDishesByRestaurant(restaurantId);

      // Récupérer la réponse de la méthode du remoteDataSource
      final response =
          await remoteDataSource.getDishesByRestaurant(restaurantId);
      return DataSuccess<List<Dish>>(response.data);
    } catch (e) {
      throw Exception('Failed to fetch dishes');
    }
  }
}
