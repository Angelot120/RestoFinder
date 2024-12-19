import 'package:restofinder/domain/entities/Dish.dart';

class DishModel extends Dish {
  DishModel({
    required super.id,
    required super.name,
    required super.description,
    required super.price,
    required super.ingredients,
    required super.calories,
    required super.carbs,
    required super.protein,
    required super.preparationTime,
    required super.cuisineType,
    required super.photos,
  });

  factory DishModel.fromJson(Map<String, dynamic> json) {
    return DishModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] as num).toDouble(),
      ingredients: List<String>.from(json['ingredients'] ?? []),
      calories: json['calories'] ?? 0,
      carbs: (json['carbs'] as num).toDouble(),
      protein: (json['protein'] as num).toDouble(),
      preparationTime: json['preparation_time'] ?? 0,
      cuisineType: json['cuisine_type'] ?? '',
      photos: List<String>.from(json['photos'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'ingredients': ingredients,
      'calories': calories,
      'carbs': carbs,
      'protein': protein,
      'preparation_time': preparationTime,
      'cuisine_type': cuisineType,
      'photos': photos,
    };
  }
}
