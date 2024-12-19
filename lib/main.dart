import 'package:flutter/material.dart';
import 'package:restofinder/config/theme/app_themes.dart';
import 'package:restofinder/data/models/restaurant_model.dart';
import 'package:restofinder/domain/entities/Restaurant.dart';
import 'package:restofinder/presentation/screens/loading_screen.dart';
// import 'package:restofinder/presentation/screens/home_screen.dart';
import 'package:restofinder/presentation/screens/restaurant_details_screen.dart';
// import 'package:restofinder/presentation/screens/loading_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final Map<String, dynamic> jsonData = {
    "id": 1,
    "name": "Le Gourmet Parisien",
    "description":
        "Un restaurant chic servant une cuisine française traditionnelle avec des ingrédients locaux.",
    "address": "12 Rue de la Gastronomie, 75000 Paris, France",
    "phone": "+33 1 42 68 53 33",
    "email": "contact@gourmetparisien.fr",
    "website": "https://www.gourmetparisien.fr",
    "location": {
      "latitude": 48.8566,
      "longitude": 2.3522,
      "distance": "1.2 km"
    },
    "menu": [
      {
        "category": "Entrées",
        "items": [
          {"name": "Foie Gras", "price": 18.5},
          {"name": "Salade de Chèvre Chaud", "price": 12.0}
        ]
      },
      {
        "category": "Plats Principaux",
        "items": [
          {"name": "Boeuf Bourguignon", "price": 25.0},
          {"name": "Magret de Canard", "price": 22.0}
        ]
      },
      {
        "category": "Desserts",
        "items": [
          {"name": "Crème Brûlée", "price": 8.5},
          {"name": "Tarte Tatin", "price": 9.0}
        ]
      }
    ],
    "photos": [
      "https://www.arubahostess.com/wp-content/uploads/2021/12/Restaurants-Aruba.jpg",
      "https://www.arubahostess.com/wp-content/uploads/2021/12/Restaurants-Aruba.jpg"
    ],
    "rating": {
      "average": 4.7,
      "reviews_count": 120,
      "comments": [
        "Une expérience culinaire exceptionnelle !",
        "Le service était impeccable et la nourriture délicieuse."
      ]
    }
  };

  // Désérialisation du JSON en un objet Restaurant
  Future<Restaurant> loadRestaurantData() async {
    await Future.delayed(Duration(seconds: 4)); // Simule un délai de chargement
    print("Chargement des données...");
    return RestaurantModel.fromJson(
        jsonData); // Retourne le restaurant désérialisé
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RestoFinder',
      theme: theme(),
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<Restaurant>(
          future: loadRestaurantData(), // Charge les données
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Scaffold(body: LoadingScreen()
                  // Center(child: CircularProgressIndicator()),
                  );
            } else if (snapshot.hasError) {
              return Scaffold(
                body: Stack(
                  children: [
                    LoadingScreen(),
                    Center(child: Text('Erreur de chargement des données...'))
                  ],
                ),
              );
            } else if (snapshot.hasData) {
              return RestaurantDetailsScreen(
                restaurant: snapshot.data!,
              );
            } else {
              return Scaffold(
                body: Center(child: Text('Aucune donnée disponible')),
              );
            }
          }),
    );
  }
}
