import 'package:restofinder/domain/entities/Dish.dart';

abstract class DishState {}

class DishInitialState extends DishState {}

class DishLoadingState extends DishState {}

class DishLoadedState extends DishState {
  final List<Dish> dishes;

  DishLoadedState(this.dishes);
}

class DishErrorState extends DishState {
  final String message;

  DishErrorState(this.message);
}
