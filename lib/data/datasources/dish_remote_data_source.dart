// import 'dart:convert';
// import 'dart:io';

import 'package:dio/dio.dart';
import 'package:restofinder/core/constants/constants.dart';
import 'package:restofinder/domain/entities/Dish.dart';
// import 'package:http/http.dart' as http;
import 'package:retrofit/retrofit.dart';

part 'dish_remote_data_source.g.dart';

@RestApi(baseUrl: newsAPIBaseURL)
abstract class DishRemoteDataSource {
  factory DishRemoteDataSource (Dio dio) = _DishRemoteDataSource;

  @GET('dishes/{id}')
  Future<HttpResponse<Dish>> getDish(
    @Path("id") int id, {
    @Query('apiKey') String? apiKey,
  });

  @GET('restaurants/{restaurantId}/dishes')
  Future<HttpResponse<List<Dish>>> getDishesByRestaurant(
    @Path("restaurantId") int restaurantId,
  );

}


