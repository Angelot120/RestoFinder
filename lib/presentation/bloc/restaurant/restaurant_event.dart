abstract class RestaurantEvent {}

class FetchRestaurantEvent extends RestaurantEvent {
  final int restaurantId;
  
  FetchRestaurantEvent(this.restaurantId);
}