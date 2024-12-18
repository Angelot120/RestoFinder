import 'dart:convert';

import 'package:restofinder/domain/entities/Dish.dart';
import 'package:http/http.dart' as http;

abstract class DishRemoteDataSource {
  Future<Dish> getDish(int id);
  Future<List<Dish>> getDishesByRestaurant(int restaurantId);
}

class DishRemoteDataSourceImpl implements DishRemoteDataSource {
  final http.Client client;

  DishRemoteDataSourceImpl({required this.client});

  @override
  Future<Dish> getDish(int id) async {
    final response =
        await client.get(Uri.parse('https://api.example.com/dishes/$id'));

    if (response.statusCode == 200) {
      return Dish.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load dish');
    }
  }

  @override
  Future<List<Dish>> getDishesByRestaurant(int restaurantId) async {
    final response = await client.get(
        Uri.parse('https://api.example.com/restaurants/$restaurantId/dishes'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Dish.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load dishes for restaurant');
    }
  }
}

// abstract class DishRemoteDataSource {
//   Future<List<Dish>> getDishes(
//       int restaurantId); // Récupérer la liste des plats pour un restaurant spécifique
//   Future<Dish> getDishDetails(
//       int dishId); // Récupérer les détails d'un plat spécifique
// }

// class DishRemoteDataSourceImpl implements DishRemoteDataSource {
//   final String baseUrl;

//   DishRemoteDataSourceImpl(this.baseUrl);

//   @override
//   Future<List<Dish>> getDishes(int restaurantId) async {
//     final response =
//         await http.get(Uri.parse('$baseUrl/restaurants/$restaurantId/dishes'));

//     if (response.statusCode == 200) {
//       final List<dynamic> data = json.decode(response.body);
//       return data.map((item) => Dish.fromJson(item)).toList();
//     } else {
//       throw Exception('Failed to load dishes');
//     }
//   }

//   @override
//   Future<Dish> getDishDetails(int dishId) async {
//     final response = await http.get(Uri.parse('$baseUrl/dishes/$dishId'));

//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       return Dish.fromJson(data);
//     } else {
//       throw Exception('Failed to load dish details');
//     }
//   }
// }
