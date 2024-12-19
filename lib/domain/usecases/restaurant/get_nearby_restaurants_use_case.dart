// import 'package:dartz/dartz.dart';
// import 'package:restofinder/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
// import 'package:restofinder/core/errors/failure.dart';
import 'package:restofinder/core/resources/data_state.dart';
import 'package:restofinder/domain/entities/Restaurant.dart';
import 'package:restofinder/domain/repositories/restaurant_repository.dart';
import 'package:restofinder/core/usecases/use_case.dart';

class GetNearbyRestaurants
    implements
        UseCase<Either<DataState, List<Restaurant>>, Map<String, double>> {
  final RestaurantRepository repository;

  GetNearbyRestaurants(this.repository);

  @override
  Future<Either<DataState, List<Restaurant>>> call(Map<String, double> params) {
    return repository.getNearbyRestaurants(params['latitude'] ?? 0.0,
        params['longitude'] ?? 0.0, params['radius'] ?? 10.0);
  }
}

// class NearbyRestaurantsParams {
//   final double latitude;
//   final double longitude;
//   final double? radius;

//   NearbyRestaurantsParams(
//       {required this.latitude, required this.longitude, this.radius});
// }
