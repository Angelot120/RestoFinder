import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restofinder/domain/entities/Dish.dart';
import 'package:restofinder/domain/repositories/dish_repository.dart';
import 'package:restofinder/presentation/bloc/dish/dish_event.dart';
import 'package:restofinder/presentation/bloc/dish/dish_state.dart';

class DishBloc extends Bloc<DishEvent, DishState> {
  final DishRepository dishRepository;

  DishBloc(this.dishRepository) : super(DishInitialState());

  // @override
  Stream<DishState> mapEventToState(DishEvent event) async* {
    if (event is FetchDishesEvent) {
      yield DishLoadingState();

      try {
        final dishes =
            await dishRepository.getDishesByRestaurant(event.restaurantId);
        yield DishLoadedState(dishes as List<Dish>);
      } catch (e) {
        yield DishErrorState(e.toString());
      }
    }
  }
}
