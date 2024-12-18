import 'package:restofinder/domain/entities/Restaurant.dart';

class RestaurantModel extends Restaurant {
  RestaurantModel({
    required super.id,
    required super.name,
    required super.description,
    required super.address,
    required super.phone,
    required super.email,
    required super.website,
    required super.location,
    required super.menu,
    required super.rating,
    required super.photos,
  });

  //

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      address: json['address'],
      phone: json['phone'],
      email: json['email'],
      website: json['website'],
      // openingHours: Map<String, String>.from(json['opening_hours']),
      location: Location(
        latitude: json['location']['latitude'],
        longitude: json['location']['longitude'],
        distance: json['location']['distance'],
      ),
      menu:
          (json['menu'] as List).map((e) => MenuCategory.fromJson(e)).toList(),
      rating: Rating.fromJson(json['rating']),
      photos: List<String>.from(json['photos']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'address': address,
      'phone': phone,
      'email': email,
      'website': website,
      // 'opening_hours': openingHours,
      'location': {
        'latitude': location.latitude,
        'longitude': location.longitude,
        'distance': location.distance,
      },
      'menu': menu.map((e) => e.toJson()).toList(),
      'rating': rating.toJson(),
      'photos': photos,
    };
  }
}

class MenuCategoryModel extends MenuCategory {
  MenuCategoryModel({required super.category, required super.items});

  factory MenuCategoryModel.fromJson(Map<String, dynamic> json) {
    return MenuCategoryModel(
      category: json['category'],
      items: (json['items'] as List)
          .map((itemJson) => MenuItem(
                name: itemJson['name'],
                price: itemJson['price'],
              ))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'items': items
          .map((item) => {'name': item.name, 'price': item.price})
          .toList(),
    };
  }
}

class RatingModel extends Rating {
  RatingModel({
    required super.average,
    required super.reviewsCount,
    required super.comments,
  });

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(
      average: json['average'],
      reviewsCount: json['reviews_count'],
      comments: List<String>.from(json['comments']),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'average': average,
      'reviews_count': reviewsCount,
      'comments': comments,
    };
  }
}
