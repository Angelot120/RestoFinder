import 'package:flutter/material.dart';
import 'package:restofinder/domain/entities/Restaurant.dart';

class DishInfo extends StatefulWidget {
  final Dish dish;
  const DishInfo({super.key, required this.dish});

  @override
  DishInfoState createState() => DishInfoState();
}

class DishInfoState extends State<DishInfo> {
  int _quantity = 1;
  late double totalPrice;

  @override
  void initState() {
    super.initState();
    totalPrice = (widget.dish.price *
        _quantity); // Initialisation correcte dans initState()
  }

  // Fonction pour augmenter la quantité
  void increaseQuantity() {
    setState(() {
      _quantity++;
      totalPrice = widget.dish.price * _quantity;
    });
  }

  // Fonction pour diminuer la quantité
  void decreaseQuantity() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
        totalPrice = widget.dish.price * _quantity;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final dish = widget.dish;

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        dish.name,
                        style: TextStyle(fontSize: 30),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      children: [
                        Material(
                          color: Color(0xFFF0F0F0),
                          borderRadius: BorderRadius.circular(50),
                          child: IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: decreaseQuantity,
                          ),
                        ),
                        SizedBox(width: 8),
                        Text('$_quantity', style: TextStyle(fontSize: 20)),
                        SizedBox(width: 8),
                        Material(
                          color: Color(0xFFFF7F00),
                          borderRadius: BorderRadius.circular(50),
                          child: IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: increaseQuantity,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Description',
                      style:
                          TextStyle(fontSize: 17, fontFamily: 'Quicksand-bold'),
                    ),
                    Text(
                      style: TextStyle(fontSize: 12, fontFamily: 'Quicksand'),
                      dish.description,
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nutritional Info',
                      style:
                          TextStyle(fontSize: 17, fontFamily: 'Quicksand-bold'),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        NutritionalInfoCard(title: 'Cal', value: dish.calories),
                        NutritionalInfoCard(title: 'Prot', value: dish.protein),
                        NutritionalInfoCard(title: 'Glu', value: dish.carbs),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ingredients',
                      style:
                          TextStyle(fontSize: 17, fontFamily: 'Quicksand-bold'),
                    ),
                    SizedBox(height: 10),
                    // ListView pour le scroll horizontal
                    Container(
                      height: 50, // Hauteur de la vue pour les ingrédients
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: dish.ingredients.length,
                        itemBuilder: (context, index) {
                          return IngredientCard(
                              ingredient: dish.ingredients[index]);
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Wrap(
                  children: [
                    Text(
                      'Temps de préparation: ',
                      style:
                          TextStyle(fontSize: 17, fontFamily: 'Quicksand-bold'),
                    ),
                    Text(
                      '${dish.preparationTime} min',
                      style: TextStyle(fontSize: 17, fontFamily: 'Quicksand'),
                    ),
                  ],
                ),
                SizedBox(height: 90),
              ],
            ),
          ),
        ),
        // Fixed button at the bottom
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(181, 255, 128, 0),
                    spreadRadius: 0,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 10),
              child: ElevatedButton(
                onPressed: () {
                  print("Added to cart");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFF7F00),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child: Wrap(
                  children: [
                    Text(
                      "\$ ${totalPrice.toStringAsFixed(2)} - ",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    Text(
                      'Add to cart',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class NutritionalInfoCard extends StatelessWidget {
  final String title;
  final double value;

  const NutritionalInfoCard(
      {Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      decoration: BoxDecoration(
        color: Color(0xFFF0F0F0),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(title, style: TextStyle(fontSize: 17, fontFamily: 'Quicksand')),
          Text('${value.toStringAsFixed(0)}', style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}

class IngredientCard extends StatelessWidget {
  final String ingredient;

  const IngredientCard({Key? key, required this.ingredient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        ingredient,
        style: TextStyle(fontSize: 17, fontFamily: 'Quicksand'),
      ),
    );
  }
}
