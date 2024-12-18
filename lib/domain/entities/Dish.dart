class Dish {
  final int id;
  final String name;
  final String description;
  final double price;
  final List<String> ingredients;
  final int calories;
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
}
