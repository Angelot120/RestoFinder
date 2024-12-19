import 'package:equatable/equatable.dart';

// New extends added
class Dish extends Equatable {
  final int? id;
  final String? name;
  final String? description;
  final double? price;
  final List<String>? ingredients;
  final int? calories;
  final double? carbs;
  final double? protein;
  final int? preparationTime;
  final String? cuisineType;
  final List<String>? photos;

  Dish({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.ingredients,
    required this.calories,
    required this.carbs,
    required this.protein,
    required this.preparationTime,
    required this.cuisineType,
    required this.photos,
  });

  // Méthode pour convertir le JSON en objet Dish
  factory Dish.fromJson(Map<String, dynamic> json) {
    return Dish(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'].toDouble(),
      ingredients: List<String>.from(json['ingredients']),
      calories: json['calories'].toDouble(),
      carbs: json['carbs'].toDouble(),
      protein: json['protein'].toDouble(),
      preparationTime: json['preparationTime'],
      cuisineType: json['cuisineType'],
      photos: List<String>.from(json['photos']),
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
      'preparationTime': preparationTime,
      'cuisineType': cuisineType,
      'photos': photos,
    };
  }

// New added override
  @override
  // TODO: implement props
  List<Object?> get props {
    return [
      id,
      name,
      description,
      price,
      ingredients,
      calories,
      carbs,
      protein,
      preparationTime,
      cuisineType,
      photos,
    ];
  }
}
