// lib/data/datasources/restaurant_remote_data_source.dart

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:restofinder/core/constants/constants.dart';
import 'package:path_provider/path_provider.dart';
import 'package:restofinder/data/models/restaurant_model.dart';
import 'package:restofinder/domain/entities/Restaurant.dart';
// import 'package:http/http.dart' as http;

class RestaurantRemoteDataSource {
  final Dio dio;

  // Constructor
  RestaurantRemoteDataSource(this.dio);

  // Méthode pour récupérer un restaurant par ID
  Future<Map<String, dynamic>> getRestaurant(int id) async {
    try {
      final response = await dio.get(
        detailsAPIBaseURL,
        queryParameters: {
          'placeid': id.toString(),
          'key': newsApiKey,
        },
      );
      print("Réponse API : ${response.data}");

      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/response.json');
      await file.writeAsString(jsonEncode(response.data), mode: FileMode.write);
      print('Réponse sauvegardée dans response.json');

      return response.data;
    } catch (e) {
      print("Erreur lors de la récupération du restaurant : $e");
      throw Exception('Failed to load restaurant');
    }
  }

  Future<List<Map<String, dynamic>>> getNearbyRestaurants(
    double latitude,
    double longitude,
    double radius,
  ) async {
    print('$latitude,$longitude, $radius');

    // Simuler la récupération des restaurants
    final List<RestaurantModel> restaurants = [
      RestaurantModel(
        id: 3,
        name: "La Table de Provence",
        description: "Un restaurant méridional avec des saveurs du sud.",
        address: "10 Avenue des Oliviers, 75020 Paris, France",
        phone: "+33 1 40 12 34 56",
        email: "contact@latabledeprovence.fr",
        website: "https://www.latabledeprovence.fr",
        location:
            Location(latitude: 48.8606, longitude: 2.3402, distance: "1.5 km"),
        menu: [
          MenuCategory(category: "Entrées", items: [
            Dish(
                id: 1,
                name: "Tapenade",
                description: "Pâté d'olive avec ail et câpres.",
                price: 9.5,
                ingredients: ["Olives", "Ail", "Câpres"],
                calories: 120,
                carbs: 5.0,
                protein: 2.0,
                preparationTime: 10,
                cuisineType: "Provençale",
                photos: ["assets/images/one.jpg"]),
            Dish(
                id: 2,
                name: "Salade Niçoise",
                description: "Salade fraîche de thon et légumes.",
                price: 14.0,
                ingredients: ["Thon", "Légumes", "Olives", "Oeufs"],
                calories: 200,
                carbs: 8.0,
                protein: 12.0,
                preparationTime: 15,
                cuisineType: "Provençale",
                photos: ["assets/images/twoo.jpg"]),
          ]),
          MenuCategory(category: "Plats Principaux", items: [
            Dish(
                id: 3,
                name: "Bouillabaisse",
                description: "Ragoût de poissons de Méditerranée.",
                price: 27.0,
                ingredients: ["Poisson", "Fenouil", "Tomates"],
                calories: 300,
                carbs: 15.0,
                protein: 25.0,
                preparationTime: 60,
                cuisineType: "Méditerranéenne",
                photos: ["assets/images/three.jpg"]),
            Dish(
                id: 4,
                name: "Ratatouille",
                description: "Légumes mijotés avec des herbes de Provence.",
                price: 19.0,
                ingredients: ["Courgette", "Tomates", "Poivrons"],
                calories: 180,
                carbs: 12.0,
                protein: 3.0,
                preparationTime: 45,
                cuisineType: "Française",
                photos: ["assets/images/foor.jpg"]),
          ]),
          MenuCategory(category: "Desserts", items: [
            Dish(
                id: 5,
                name: "Clafoutis",
                description: "Gâteau aux cerises.",
                price: 6.5,
                ingredients: ["Cerises", "Lait", "Farine"],
                calories: 180,
                carbs: 20.0,
                protein: 5.0,
                preparationTime: 40,
                cuisineType: "Française",
                photos: ["assets/images/one.jpg"]),
          ])
        ],
        photos: ["assets/images/twoo.jpg", "assets/images/three.jpg"],
        rating: Rating(
          average: 4.8,
          reviewsCount: 150,
          comments: [
            "Un endroit parfait pour découvrir les saveurs du sud.",
            "Le service est impeccable et la cuisine savoureuse."
          ],
        ),
      ),
      RestaurantModel(
        id: 5,
        name: "L'Oasis Méditerranéenne",
        description:
            "Des saveurs méditerranéennes authentiques dans un cadre chaleureux.",
        address: "18 Place du Marché, 13001 Marseille, France",
        phone: "+33 4 91 22 33 44",
        email: "contact@loasis.fr",
        website: "https://www.loasis.fr",
        location: Location(
            latitude: 43.296482, longitude: 5.36978, distance: "500 m"),
        menu: [
          MenuCategory(category: "Entrées", items: [
            Dish(
                id: 11,
                name: "Houmous",
                description:
                    "Purée de pois chiches avec huile d'olive et citron.",
                price: 6.0,
                ingredients: ["Pois chiches", "Tahini", "Citron"],
                calories: 120,
                carbs: 12.0,
                protein: 5.0,
                preparationTime: 10,
                cuisineType: "Méditerranéenne",
                photos: ["assets/images/foor.jpg"]),
            Dish(
                id: 12,
                name: "Taboulé",
                description: "Salade libanaise de persil, menthe, et boulgour.",
                price: 8.0,
                ingredients: ["Persil", "Menthe", "Boulgour"],
                calories: 140,
                carbs: 15.0,
                protein: 3.0,
                preparationTime: 10,
                cuisineType: "Méditerranéenne",
                photos: ["assets/images/one.jpg"]),
          ]),
          MenuCategory(category: "Plats Principaux", items: [
            Dish(
                id: 13,
                name: "Tajine de Poulet",
                description: "Poulet mijoté aux citrons confits et olives.",
                price: 20.0,
                ingredients: ["Poulet", "Citrons confits", "Olives"],
                calories: 280,
                carbs: 10.0,
                protein: 25.0,
                preparationTime: 60,
                cuisineType: "Marocaine",
                photos: ["assets/images/twoo.jpg"]),
            Dish(
                id: 14,
                name: "Moussaka",
                description: "Gratin d'aubergines avec viande hachée.",
                price: 18.0,
                ingredients: ["Aubergines", "Viande hachée", "Tomates"],
                calories: 250,
                carbs: 12.0,
                protein: 20.0,
                preparationTime: 45,
                cuisineType: "Grecque",
                photos: ["assets/images/three.jpg"]),
          ]),
          MenuCategory(category: "Desserts", items: [
            Dish(
                id: 15,
                name: "Baklava",
                description: "Feuilleté sucré aux noix et miel.",
                price: 5.5,
                ingredients: ["Noix", "Miel", "Pâte filo"],
                calories: 180,
                carbs: 20.0,
                protein: 3.0,
                preparationTime: 20,
                cuisineType: "Méditerranéenne",
                photos: ["assets/images/foor.jpg"]),
          ])
        ],
        photos: ["assets/images/one.jpg", "assets/images/twoo.jpg"],
        rating: Rating(
          average: 4.6,
          reviewsCount: 120,
          comments: [
            "Délicieux et authentique, un vrai goût méditerranéen.",
            "Service convivial et plats généreux."
          ],
        ),
      ),
      RestaurantModel(
        id: 6,
        name: "Chez Louis",
        description:
            "Un bistrot chaleureux proposant des classiques de la cuisine française.",
        address: "5 Rue des Champs, 69001 Lyon, France",
        phone: "+33 4 78 45 67 89",
        email: "contact@chezlouis.fr",
        website: "https://www.chezlouis.fr",
        location: Location(
            latitude: 45.764043, longitude: 4.835659, distance: "750 m"),
        menu: [
          MenuCategory(category: "Entrées", items: [
            Dish(
                id: 16,
                name: "Salade Lyonnaise",
                description: "Salade verte, lardons, œuf poché et croûtons.",
                price: 8.5,
                ingredients: ["Salade", "Lardons", "Œuf poché", "Croûtons"],
                calories: 180,
                carbs: 10.0,
                protein: 12.0,
                preparationTime: 15,
                cuisineType: "Française",
                photos: ["assets/images/three.jpg"]),
            Dish(
                id: 17,
                name: "Quenelle Sauce Nantua",
                description:
                    "Spécialité lyonnaise servie avec une sauce à la crevette.",
                price: 10.0,
                ingredients: ["Quenelle", "Crevettes", "Crème"],
                calories: 210,
                carbs: 15.0,
                protein: 14.0,
                preparationTime: 20,
                cuisineType: "Française",
                photos: ["assets/images/foor.jpg"]),
          ]),
          MenuCategory(category: "Plats Principaux", items: [
            Dish(
                id: 18,
                name: "Andouillette",
                description: "Andouillette grillée avec sauce moutarde.",
                price: 18.0,
                ingredients: ["Andouillette", "Moutarde", "Épices"],
                calories: 350,
                carbs: 8.0,
                protein: 28.0,
                preparationTime: 30,
                cuisineType: "Française",
                photos: ["assets/images/one.jpg"]),
            Dish(
                id: 19,
                name: "Bœuf Bourguignon",
                description: "Ragoût de bœuf mijoté au vin rouge.",
                price: 20.0,
                ingredients: ["Bœuf", "Vin rouge", "Carottes", "Oignons"],
                calories: 400,
                carbs: 12.0,
                protein: 35.0,
                preparationTime: 120,
                cuisineType: "Française",
                photos: ["assets/images/twoo.jpg"]),
          ]),
          MenuCategory(category: "Desserts", items: [
            Dish(
                id: 20,
                name: "Tarte Tatin",
                description: "Tarte renversée aux pommes caramélisées.",
                price: 6.5,
                ingredients: ["Pommes", "Sucre", "Pâte brisée"],
                calories: 280,
                carbs: 30.0,
                protein: 4.0,
                preparationTime: 25,
                cuisineType: "Française",
                photos: ["assets/images/three.jpg"]),
          ])
        ],
        photos: ["assets/images/foor.jpg", "assets/images/one.jpg"],
        rating: Rating(
          average: 4.5,
          reviewsCount: 100,
          comments: [
            "Ambiance chaleureuse et plats traditionnels délicieux.",
            "Un bistrot où on revient toujours avec plaisir."
          ],
        ),
      ),
      RestaurantModel(
        id: 7,
        name: "Bella Italia",
        description: "Un voyage culinaire au cœur de l'Italie.",
        address: "10 Via Roma, 20121 Milan, Italie",
        phone: "+39 02 76 55 88 99",
        email: "contact@bellaitalia.it",
        website: "assets/images/twoo.jpg",
        location: Location(
            latitude: 45.464204, longitude: 9.189982, distance: "1.2 km"),
        menu: [
          MenuCategory(category: "Entrées", items: [
            Dish(
                id: 21,
                name: "Bruschetta",
                description:
                    "Pain grillé avec tomates fraîches, basilic et huile d'olive.",
                price: 7.0,
                ingredients: ["Pain", "Tomates", "Basilic"],
                calories: 120,
                carbs: 20.0,
                protein: 3.0,
                preparationTime: 10,
                cuisineType: "Italienne",
                photos: ["assets/images/three.jpg"]),
            Dish(
                id: 22,
                name: "Carpaccio de Bœuf",
                description:
                    "Fines tranches de bœuf avec roquette et parmesan.",
                price: 12.0,
                ingredients: ["Bœuf", "Roquette", "Parmesan"],
                calories: 200,
                carbs: 5.0,
                protein: 18.0,
                preparationTime: 15,
                cuisineType: "Italienne",
                photos: ["assets/images/foor.jpg"]),
          ]),
          MenuCategory(category: "Plats Principaux", items: [
            Dish(
                id: 23,
                name: "Risotto alla Milanese",
                description: "Risotto crémeux au safran.",
                price: 16.0,
                ingredients: ["Riz", "Safran", "Parmesan"],
                calories: 320,
                carbs: 50.0,
                protein: 8.0,
                preparationTime: 30,
                cuisineType: "Italienne",
                photos: ["assets/images/one.jpg"]),
            Dish(
                id: 24,
                name: "Pizza Margherita",
                description:
                    "Pizza classique avec tomate, mozzarella et basilic.",
                price: 10.0,
                ingredients: ["Tomate", "Mozzarella", "Basilic"],
                calories: 250,
                carbs: 40.0,
                protein: 10.0,
                preparationTime: 20,
                cuisineType: "Italienne",
                photos: ["assets/images/twoo.jpg"]),
          ]),
          MenuCategory(category: "Desserts", items: [
            Dish(
                id: 25,
                name: "Tiramisu",
                description: "Dessert italien classique à base de mascarpone.",
                price: 8.0,
                ingredients: ["Mascarpone", "Café", "Biscuit"],
                calories: 320,
                carbs: 25.0,
                protein: 6.0,
                preparationTime: 20,
                cuisineType: "Italienne",
                photos: ["assets/images/three.jpg"]),
          ])
        ],
        photos: ["assets/images/foor.jpg", "assets/images/one.jpg"],
        rating: Rating(
          average: 4.8,
          reviewsCount: 200,
          comments: [
            "La meilleure cuisine italienne de la région.",
            "Les pâtes et les pizzas sont exceptionnelles."
          ],
        ),
      ),
      RestaurantModel(
        id: 8,
        name: "Le Gourmet Indien",
        description:
            "Un restaurant qui vous emmène au cœur des saveurs épicées de l'Inde.",
        address: "25 Rue du Taj Mahal, 75010 Paris, France",
        phone: "+33 1 42 78 90 12",
        email: "contact@legourmetindien.fr",
        website: "assets/images/one.jpg",
        location:
            Location(latitude: 48.8675, longitude: 2.3508, distance: "2.0 km"),
        menu: [
          MenuCategory(category: "Entrées", items: [
            Dish(
                id: 26,
                name: "Pakoras",
                description: "Beignets de légumes épicés.",
                price: 6.0,
                ingredients: ["Légumes", "Farine de pois chiches", "Épices"],
                calories: 200,
                carbs: 18.0,
                protein: 4.0,
                preparationTime: 15,
                cuisineType: "Indienne",
                photos: ["assets/images/twoo.jpg"]),
            Dish(
                id: 27,
                name: "Samosas",
                description:
                    "Triangles croustillants garnis de légumes ou de viande.",
                price: 5.5,
                ingredients: ["Pâte", "Légumes", "Épices"],
                calories: 180,
                carbs: 20.0,
                protein: 5.0,
                preparationTime: 10,
                cuisineType: "Indienne",
                photos: ["assets/images/three.jpg"]),
          ]),
          MenuCategory(category: "Plats Principaux", items: [
            Dish(
                id: 28,
                name: "Poulet Tikka Masala",
                description:
                    "Poulet mariné et mijoté dans une sauce épicée et crémeuse.",
                price: 14.0,
                ingredients: ["Poulet", "Tomates", "Crème", "Épices"],
                calories: 320,
                carbs: 10.0,
                protein: 25.0,
                preparationTime: 25,
                cuisineType: "Indienne",
                photos: ["assets/images/foor.jpg"]),
            Dish(
                id: 29,
                name: "Biryani aux Crevettes",
                description: "Riz parfumé aux épices et crevettes.",
                price: 16.0,
                ingredients: ["Riz", "Crevettes", "Épices"],
                calories: 350,
                carbs: 40.0,
                protein: 20.0,
                preparationTime: 30,
                cuisineType: "Indienne",
                photos: ["assets/images/one.jpg"]),
          ]),
          MenuCategory(category: "Desserts", items: [
            Dish(
                id: 30,
                name: "Gulab Jamun",
                description:
                    "Boules de lait frits dans un sirop sucré parfumé à la rose.",
                price: 6.0,
                ingredients: ["Lait", "Farine", "Sirop de rose"],
                calories: 250,
                carbs: 30.0,
                protein: 4.0,
                preparationTime: 10,
                cuisineType: "Indienne",
                photos: ["assets/images/twoo.jpg"]),
            Dish(
                id: 31,
                name: "Kheer",
                description:
                    "Riz au lait sucré avec des épices et des fruits secs.",
                price: 5.5,
                ingredients: ["Riz", "Lait", "Sucre", "Épices", "Fruits secs"],
                calories: 200,
                carbs: 25.0,
                protein: 6.0,
                preparationTime: 15,
                cuisineType: "Indienne",
                photos: ["assets/images/three.jpg"]),
          ]),
        ],
        photos: ["assets/images/one.jpg", "assets/images/foor.jpg"],
        rating: Rating(
          average: 4.7,
          reviewsCount: 180,
          comments: [
            "Les saveurs authentiques de l'Inde, un pur régal.",
            "Les épices sont parfaitement dosées, et l'accueil est chaleureux."
          ],
        ),
      ),
    ];
    // Convertir chaque RestaurantModel en un Map<String, dynamic> via la méthode toJson()
    return restaurants
        .map((restaurant) => restaurant.toJson() as Map<String, dynamic>)
        .toList();
  }
}

  // Méthode pour récupérer les restaurants à proximité
//   Future<List<Map<String, dynamic>>> getNearbyRestaurants(
//     double latitude,
//     double longitude,
//     double radius,
//   ) async {
//     try {
//       // Construction de l'URL de la requête
//       final Uri uri = Uri.parse(newsAPIBaseURL).replace(queryParameters: {
//         'location': '$latitude,$longitude',
//         'radius': radius.toInt().toString(),
//         'key': newsApiKey,
//       });

//       // Envoi de la requête GET
//       final response = await http.get(uri);

//       print("Réponse API : ${response}");

//       // Vérifier si la réponse est réussie (code 200)
//       if (response.statusCode == 200) {
//         // Convertir la réponse en format JSON
//         final Map<String, dynamic> data = jsonDecode(response.body);
//         return List<Map<String, dynamic>>.from(data['results']);
//       } else {
//         throw Exception('Failed to load nearby restaurants');
//       }
//     } catch (e) {
//       print("Erreur lors de la récupération des restaurants : $e");
//       throw Exception('Failed to load nearby restaurants');
//     }
//   }



//// ----------------------------------------------------------------------






// import 'package:dio/dio.dart';
// import 'package:retrofit/retrofit.dart';
// import 'package:restofinder/core/constants/constants.dart';

// part 'restaurant_remote_data_source.g.dart';

// @RestApi(baseUrl: newsAPIBaseURL)
// abstract class RestaurantRemoteDataSource {
//   factory RestaurantRemoteDataSource(Dio dio) = _RestaurantRemoteDataSource;

//   @GET('place/details/json')
//   Future<Map<String, dynamic>> getRestaurant(@Path("id") int id);

//   @GET('place/nearbysearch/json')
//   Future<List<Map<String, dynamic>>> getNearbyRestaurants(
//     @Query('latitude') double latitude,
//     @Query('longitude') double longitude,
//     @Query('radius') double radius,
//   );
// }


/////////////////////////////////////////////////////


// import 'package:dio/dio.dart';
// import 'package:restofinder/core/constants/constants.dart';

// import 'package:retrofit/retrofit.dart';
// part 'restaurant_remote_data_source.g.dart';

// @RestApi(baseUrl: newsAPIBaseURL)
// abstract class RestaurantRemoteDataSource {
//   factory RestaurantRemoteDataSource(Dio dio) = _RestaurantRemoteDataSource;

//   // Future<Map<String, dynamic>> getRestaurant(int id);
//   // Future<List<Map<String, dynamic>>> getNearbyRestaurants(
//   //     double latitude, double longitude, double radius);

//   // Méthode pour récupérer un restaurant par ID
//   @GET('restaurants/{id}')
//   Future<Map<String, dynamic>> getRestaurant(@Path('id') int id);

//   // Méthode pour récupérer les restaurants à proximité en fonction de la latitude, longitude et du rayon
//   @GET('restaurants/nearby')
//   Future<List<Map<String, dynamic>>> getNearbyRestaurants(
//     @Query('latitude') double latitude,
//     @Query('longitude') double longitude,
//     @Query('radius') double radius,
//   );
// }













// //////////////////////////////////////////////////////////////////////////







// class RestaurantRemoteDataSourceImpl implements RestaurantRemoteDataSource {
//   final Dio httpClient;

//   RestaurantRemoteDataSourceImpl(this.httpClient);

//   @override
//   Future<Map<String, dynamic>> getRestaurant(int id) async {
//     final response = await httpClient.get('/restaurants/$id');
//     return response.data;
//   }

//   @override
//   Future<List<Map<String, dynamic>>> getNearbyRestaurants(
//       double latitude, double longitude, double radius) async {
//     final response = await httpClient.get('/restaurants', queryParameters: {
//       'latitude': latitude,
//       'longitude': longitude,
//     });
//     return List<Map<String, dynamic>>.from(response.data);
//   }
// }
