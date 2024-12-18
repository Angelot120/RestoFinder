class Restaurant {
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
  final List<MenuItem> items;

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
          .map((itemJson) => MenuItem.fromJson(itemJson))
          .toList(),
    );
  }
}

class MenuItem {
  final String name;
  final double price;

  MenuItem({
    required this.name,
    required this.price,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
    };
  }

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      name: json['name'],
      price: json['price'],
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
