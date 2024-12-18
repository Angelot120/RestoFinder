import 'package:dio/dio.dart';

abstract class RestaurantRemoteDataSource {
  Future<Map<String, dynamic>> getRestaurant(int id);
  Future<List<Map<String, dynamic>>> getNearbyRestaurants(
      double latitude, double longitude, double radius);
}

class RestaurantRemoteDataSourceImpl implements RestaurantRemoteDataSource {
  final Dio httpClient;

  RestaurantRemoteDataSourceImpl(this.httpClient);

  @override
  Future<Map<String, dynamic>> getRestaurant(int id) async {
    final response = await httpClient.get('/restaurants/$id');
    return response.data;
  }

  @override
  Future<List<Map<String, dynamic>>> getNearbyRestaurants(
      double latitude, double longitude, double radius) async {
    final response = await httpClient.get('/restaurants', queryParameters: {
      'latitude': latitude,
      'longitude': longitude,
    });
    return List<Map<String, dynamic>>.from(response.data);
  }
}
