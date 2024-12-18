// import 'package:dartz/dartz.dart';
// import 'package:restofinder/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:restofinder/core/errors/failure.dart';
import 'package:restofinder/domain/entities/Restaurant.dart';
import 'package:restofinder/domain/repositories/restaurant_repository.dart';
import 'package:restofinder/core/usecases/use_case.dart';

class GetNearbyRestaurants
    implements UseCase<List<Restaurant>, NearbyRestaurantsParams> {
  final RestaurantRepository repository;

  GetNearbyRestaurants(this.repository);

  @override
  Future<Either<Failure, List<Restaurant>>> call(
      NearbyRestaurantsParams params) async {
    try {
      // Vous retournez ici un Either<Failure, List<Restaurant>>
      return await repository.getNearbyRestaurants(
          params.latitude, params.longitude, params.radius ?? 5.0);
    } catch (e) {
      // En cas d'erreur, retourner un Failure
      return Left(ServerFailure());
    }
  }
}

class NearbyRestaurantsParams {
  final double latitude;
  final double longitude;
  final double? radius;

  NearbyRestaurantsParams(
      {required this.latitude, required this.longitude, this.radius});
}
