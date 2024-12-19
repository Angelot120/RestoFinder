import 'package:restofinder/domain/entities/Restaurant.dart';

abstract class RestaurantState {}

class RestaurantInitialState extends RestaurantState {}

class RestaurantLoadingState extends RestaurantState {}

class RestaurantLoadedState extends RestaurantState {
  final Restaurant restaurant;

  RestaurantLoadedState(this.restaurant);
}

class RestaurantErrorState extends RestaurantState {
  final String message;

  RestaurantErrorState(this.message);
}
