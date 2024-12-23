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
  List<Restaurant> _restaurants = []; // Liste des restaurants

  final RestaurantRepository repository =
      RestaurantRepository(RestaurantRemoteDataSource(Dio()));

  @override
  void initState() {
    super.initState();
    _getCurrentLocationAndFetchRestaurants();
  }

  // Méthode pour obtenir la position actuelle et récupérer les restaurants
  Future<void> _getCurrentLocationAndFetchRestaurants() async {
    try {
      // Obtenir la position actuelle
      Position position = await getCurrentLocation();
      setState(() {
        _currentPosition = position; // Mise à jour de la position
      });

      // Appel pour récupérer les restaurants à proximité
      final result = await repository.getNearbyRestaurants(
        _currentPosition.latitude,
        _currentPosition.longitude,
        5000, // Rayon de 5000 mètres
      );

      result.fold(
        (failure) {
          print("Erreur: $failure");
          setState(() {
            _isLoading = false;
          });
        },
        (restaurants) {
          setState(() {
            _restaurants = restaurants; // Mise à jour de la liste des restaurants
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
      // Si les services de localisation sont désactivés
      throw Exception('Les services de localisation sont désactivés');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Si la permission est refusée
        throw Exception('Permission de localisation refusée');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Si la permission est refusée définitivement
      throw Exception('Les permissions de localisation sont définitivement refusées');
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        height: 390,
        child: _isLoading
            ? Center(child: LoadingScreen())
            : _restaurants.isEmpty
                ? Stack(
                    children: [
                      LoadingScreen(),
                      Center(child: Text("Aucun restaurant trouvé à proximité.")),
                    ],
                  )
                : ListView.builder(
                    itemCount: _restaurants.length,
                    itemBuilder: (context, index) {
                      final restaurant = _restaurants[index];
                      return ListTile(
                        title: Text(restaurant.name),
                        subtitle: Text(restaurant.address),
                        leading: Icon(Icons.restaurant),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RestaurantDetailsScreen(
                                restaurant: restaurant,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
      ),
    );
  }
}
