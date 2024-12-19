import 'package:dio/dio.dart';
import 'package:restofinder/core/constants/constants.dart';

import 'package:retrofit/retrofit.dart';
part 'restaurant_remote_data_source.g.dart';

@RestApi(baseUrl: newsAPIBaseURL)
abstract class RestaurantRemoteDataSource {
  factory RestaurantRemoteDataSource(Dio dio) = _RestaurantRemoteDataSource;

  @GET('restaurants/{id}')
  Future<Map<String, dynamic>> getRestaurant(@Path("id") int id);

  @GET('restaurants/nearby')
  Future<List<Map<String, dynamic>>> getNearbyRestaurants(
    @Query('latitude') double latitude,
    @Query('longitude') double longitude,
    @Query('radius') double radius,
  );
}
