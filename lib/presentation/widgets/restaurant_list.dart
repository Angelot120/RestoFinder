import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:restofinder/data/datasources/restaurant_remote_data_source.dart';
import 'package:restofinder/domain/entities/Restaurant.dart';
import 'package:restofinder/domain/repositories/restaurant_repository.dart';
import 'package:restofinder/presentation/screens/loading_screen.dart';
import 'package:restofinder/presentation/screens/restaurant_details_screen.dart';

class RestaurantListScreen extends StatefulWidget {
  @override
  _RestaurantListScreenState createState() => _RestaurantListScreenState();
}

class _RestaurantListScreenState extends State<RestaurantListScreen> {
  late Position _currentPosition;
  bool _isLoading = true;
  // Modified
  // List<Map<String, dynamic>> _restaurants = [];
  // Modified to
  List<Restaurant> _restaurants =
      []; // Utilise Restaurant et non Map<String, dynamic>

  final RestaurantRepository repository =
      RestaurantRepository(RestaurantRemoteDataSource(Dio()));

  @override
  void initState() {
    super.initState();
    _getCurrentLocationAndFetchRestaurants(); // Appel à la méthode définie ci-dessous
  }

  // Méthode pour obtenir la position actuelle et récupérer les restaurants
  Future<void> _getCurrentLocationAndFetchRestaurants() async {
    try {
      // Obtenez la position actuelle
      Position position = await getCurrentLocation();
      setState(() {
        _currentPosition = position;
      });

      // Appel au repository pour récupérer les restaurants à proximité

      final result = await repository.getNearbyRestaurants(
        _currentPosition.latitude,
        _currentPosition.longitude,
        5000, // Rayon de 5000 mètres
      );

      // Vérifier si la réponse est réussie (Right)
      result.fold(
        (failure) {
          // Si une erreur se produit, on peut afficher un message
          print("Erreur: $failure");
        },
        (restaurants) {
          // Si les données sont récupérées, on les met à jour dans l'état

          // Modified
          // setState(() {
          //   _restaurants = restaurants.cast<Map<String, dynamic>>();
          //   _isLoading = false;
          // });

          // Modified To
          setState(() {
            _restaurants = restaurants;
            _isLoading = false;
          });
        },
      );
    } catch (e) {
      print('Error: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Méthode pour obtenir la position actuelle avec Geolocator
  Future<Position> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permissions are permanently denied');
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
      // color: Colors.black,
      height: 390,
      child: _isLoading
          ? Center(child: LoadingScreen())
          : _restaurants.isEmpty
              ? Stack(
                  children: [
                    LoadingScreen(),
                    Center(child: Text("Aucun restaurant trouvé à proximité."))
                  ],
                )
              : ListView.builder(
                  itemCount: _restaurants.length,
                  itemBuilder: (context, index) {
                    final restaurant = _restaurants[index];
                    return ListTile(
                      // Modified

                      // title: Text(restaurant['name'] ?? 'Nom non disponible'),
                      // subtitle: Text(
                      //     restaurant['address'] ?? 'Adresse non disponible'),
                      // leading: Icon(Icons.restaurant),

                      // Modified To
                      title: Text(restaurant.name),
                      subtitle: Text(restaurant.address),
                      leading: Icon(Icons.restaurant),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RestaurantDetailsScreen(
                                    restaurant: restaurant,
                                  )),
                        );
                      },
                    );
                  },
                ),
    ));
  }
}
