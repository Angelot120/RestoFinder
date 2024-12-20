import 'package:equatable/equatable.dart';
// import 'package:restofinder/domain/entities/Dish.dart';

// New extends added
class Restaurant extends Equatable {
  late final int id;
  late final String name;
  late final String description;
  late final String address;
  late final String phone;
  late final String email;
  late final String website;
  // final Map<String, String> openingHours;
  late final Location location;
  late final List<MenuCategory> menu;
  late final List<String> photos;
  late final Rating rating;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.address,
    required this.phone,
    required this.email,
    required this.website,
    // required this.openingHours,
    required this.location,
    required this.menu,
    required this.rating,
    required this.photos,
  });

  // New added override
  @override
  List<Object?> get props {
    return [
      id,
      name,
      description,
      address,
      phone,
      email,
      website,
      // openingHours,
      location,
      menu,
      rating,
      photos,
    ];
  }

  static fromJson(Map<String, dynamic> jsonData) {}
}

class Location {
  final double latitude;
  final double longitude;
  final String distance;

  Location({
    required this.latitude,
    required this.longitude,
    required this.distance,
  });
}

// class MenuCategory {
//   final String category;
//   final List<MenuItem> items;

//   MenuCategory({
//     required this.category,
//     required this.items,
//   });
// }

// class MenuItem {
//   final String name;
//   final double price;

//   MenuItem({
//     required this.name,
//     required this.price,
//   });
// }

class MenuCategory {
  final String category;
  final List<Dish> items;

  MenuCategory({
    required this.category,
    required this.items,
  });

  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'items': items.map((item) => item.toJson()).toList(),
    };
  }

  factory MenuCategory.fromJson(Map<String, dynamic> json) {
    return MenuCategory(
      category: json['category'],
      items: (json['items'] as List)
          .map((itemJson) => Dish.fromJson(itemJson))
          .toList(),
    );
  }
}

class Dish {
  final int id;
  final String name;
  final String description;
  final double price;
  final List<String> ingredients;
  final double calories;
  final double carbs;
  final double protein;
  final int preparationTime;
  final String cuisineType;
  final List<String> photos;

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

  factory Dish.fromJson(Map<String, dynamic> json) {
    return Dish(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price']?.toDouble(),
      ingredients: List<String>.from(json['ingredients'] ?? []),
      calories: json['calories'],
      carbs: json['carbs']?.toDouble(),
      protein: json['protein']?.toDouble(),
      preparationTime: json['preparationTime'],
      cuisineType: json['cuisineType'],
      photos: List<String>.from(json['photos'] ?? []),
    );
  }
}

// Commentaires ou retours clients

// class Rating {
//   final double average;
//   final int reviewsCount;
//   final List<String> comments;

//   Rating({
//     required this.average,
//     required this.reviewsCount,
//     required this.comments,
//   });

//   Map<String, dynamic> toJson() {
//     return {
//       'average': average,
//       'reviews_count': reviewsCount,
//       'comments': comments,
//     };
//   }
// }

class Rating {
  final double average;
  final int reviewsCount;
  final List<String> comments;

  Rating({
    required this.average,
    required this.reviewsCount,
    required this.comments,
  });

  Map<String, dynamic> toJson() {
    return {
      'average': average,
      'reviews_count': reviewsCount,
      'comments': comments,
    };
  }

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      average: json['average'],
      reviewsCount: json['reviews_count'],
      comments: List<String>.from(json['comments']),
    );
  }
}
