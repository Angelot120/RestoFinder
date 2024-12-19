import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restofinder/domain/entities/Restaurant.dart';
import 'package:restofinder/domain/repositories/restaurant_repository.dart';
import 'package:restofinder/presentation/bloc/restaurant/restaurant_event.dart';
import 'package:restofinder/presentation/bloc/restaurant/restaurant_state.dart';

class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  final RestaurantRepository restaurantRepository;

  RestaurantBloc(this.restaurantRepository) : super(RestaurantInitialState());

  // @override
  Stream<RestaurantState> mapEventToState(RestaurantEvent event) async* {
    if (event is FetchRestaurantEvent) {
      yield RestaurantLoadingState();

      try {
        final restaurant =
            await restaurantRepository.getRestaurant(event.restaurantId);
        yield RestaurantLoadedState(restaurant as Restaurant);
      } catch (e) {
        yield RestaurantErrorState(e.toString());
      }
    }
  }
}
