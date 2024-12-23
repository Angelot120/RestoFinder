import 'package:flutter/material.dart';
import 'package:restofinder/domain/entities/Restaurant.dart';
import 'package:restofinder/presentation/screens/dish_details_screen.dart';
// import 'package:restofinder/presentation/widgets/location_map.dart';

class RestaurantInfo extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantInfo({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Nom et note moyenne
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  '${restaurant.name}',
                  style: TextStyle(fontSize: 30),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xFFFF7F00),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.star, color: Colors.white),
                    Text(
                      '${restaurant.rating.average}',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 20),

          // Liste des plats
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              // color: Colors.black,
              child: ListView.builder(
                shrinkWrap:
                    true, // Permet à la liste de s'adapter à son contenu
                physics:
                    NeverScrollableScrollPhysics(), // Pas de défilement indépendant
                itemCount: restaurant.menu.length, // Nombre de catégories
                itemBuilder: (context, categoryIndex) {
                  final category = restaurant.menu[categoryIndex];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          category.category,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            // color: Colors.white,
                          ),
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: category.items.length,
                        itemBuilder: (context, itemIndex) {
                          final dish = category.items[itemIndex];
                          return ListTile(
                            title: Text(
                              dish.name,
                              // style: TextStyle(color: Colors.white),
                            ),
                            subtitle: Text(
                              '${dish.price?.toStringAsFixed(2) ?? 'Prix non disponible'} €',
                              style: TextStyle(color: Colors.grey),
                            ),
                            leading:
                                Icon(Icons.restaurant, color: Colors.orange),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DishDetailsScreen(
                                          dish: dish,
                                        )),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ),

          SizedBox(height: 30),

          // Description et autres informations
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Description',
                style: TextStyle(fontSize: 25, fontFamily: 'Quicksand-bold'),
              ),
              Text(
                "${restaurant.description}",
                style: TextStyle(fontSize: 17, fontFamily: 'Quicksand'),
              ),
            ],
          ),
          SizedBox(height: 30),
          Row(
            children: [
              const Icon(Icons.location_on, color: Color(0xFFFF7F00)),
              SizedBox(width: 5),
              Text(
                '${restaurant.address}',
                style: TextStyle(fontSize: 12, fontFamily: 'Quicksand'),
              ),
            ],
          ),

          SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.phone, color: Color(0xFFFF7F00)),
              Container(
                margin: EdgeInsets.all(5),
                child: Text(
                  style: TextStyle(fontSize: 12, fontFamily: 'Quicksand'),
                  '${restaurant.phone}',
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.mail_outline, color: Color(0xFFFF7F00)),
              Container(
                margin: EdgeInsets.all(5),
                child: Text(
                  style: TextStyle(fontSize: 12, fontFamily: 'Quicksand'),
                  '${restaurant.email}',
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.public, color: Color(0xFFFF7F00)),
              Container(
                margin: EdgeInsets.all(5),
                child: Text(
                  style: TextStyle(fontSize: 12, fontFamily: 'Quicksand'),
                  '${restaurant.website}',
                ),
              ),
            ],
          ),

          SizedBox(
            height: 30,
          ),

          // Container(
          //   height: 400,
          //   decoration: BoxDecoration(
          //       color: Color(0xFFF0F0F0),
          //       borderRadius: BorderRadius.circular(30)),
          //   child: LocationMap(),
          // )
        ],
      ),
    );
  }
}
