// import 'package:dartz/dartz.dart';
// import 'package:restofinder/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:restofinder/core/resources/data_state.dart';
import 'package:restofinder/core/usecases/use_case.dart';
import 'package:restofinder/domain/entities/Restaurant.dart';
import 'package:restofinder/domain/repositories/restaurant_repository.dart';

class GetRestaurantUseCase
    implements UseCase<Either<DataState, Restaurant>, int> {
  final RestaurantRepository repository;

  GetRestaurantUseCase(this.repository);

  @override
  Future<Either<DataState, Restaurant>> call(int restaurantId) {
    return repository.getRestaurant(restaurantId);
  }
}
