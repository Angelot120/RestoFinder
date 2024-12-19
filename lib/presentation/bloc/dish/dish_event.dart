
abstract class DishEvent {}

class FetchDishesEvent extends DishEvent {
  final int restaurantId;

  FetchDishesEvent(this.restaurantId);
}