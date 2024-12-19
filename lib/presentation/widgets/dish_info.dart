import 'package:flutter/material.dart';
import 'package:restofinder/domain/entities/Dish.dart';

class DishInfo extends StatefulWidget {
  final Dish dish;
  const DishInfo({super.key, required this.dish});

  @override
  DishInfoState createState() => DishInfoState();
}

class DishInfoState extends State<DishInfo> {
  int _quantity = 1; // Valeur initiale de la quantité (commence à 1)

  // Fonction pour augmenter la quantité
  void increaseQuantity() {
    setState(() {
      _quantity++;
    });
  }

  // Fonction pour diminuer la quantité
  void decreaseQuantity() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        'Burger éclaire',
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
                        Text(
                          '$_quantity',
                          style: TextStyle(fontSize: 20),
                        ),
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
                SizedBox(
                  height: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Description',
                      style: TextStyle(fontSize: 17, fontFamily: 'Quicksand'),
                    ),
                    Text(
                        style: TextStyle(fontSize: 12, fontFamily: 'Quicksand'),
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.")
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nutrution',
                      style: TextStyle(fontSize: 17, fontFamily: 'Quicksand'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              top: 20, left: 30, bottom: 20, right: 30),
                          decoration: BoxDecoration(
                              color: Color(0xFFF0F0F0),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Text('Cal',
                                  style: TextStyle(
                                      fontSize: 17, fontFamily: 'Quicksand')),
                              Text('210', style: TextStyle(fontSize: 20)),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              top: 20, left: 30, bottom: 20, right: 30),
                          decoration: BoxDecoration(
                              color: Color(0xFFF0F0F0),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Text('Prot',
                                  style: TextStyle(
                                      fontSize: 17, fontFamily: 'Quicksand')),
                              Text('210', style: TextStyle(fontSize: 20)),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              top: 20, left: 30, bottom: 20, right: 30),
                          decoration: BoxDecoration(
                              color: Color(0xFFF0F0F0),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Text('Glu',
                                  style: TextStyle(
                                      fontSize: 17, fontFamily: 'Quicksand')),
                              Text('210', style: TextStyle(fontSize: 20)),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ingrédients',
                      style: TextStyle(fontSize: 17, fontFamily: 'Quicksand'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              top: 20, left: 30, bottom: 20, right: 30),
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
                          child: Column(
                            children: [
                              Text('Tomate',
                                  style: TextStyle(
                                      fontSize: 17, fontFamily: 'Quicksand')),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              top: 20, left: 30, bottom: 20, right: 30),
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
                          child: Column(
                            children: [
                              Text('Tomate',
                                  style: TextStyle(
                                      fontSize: 17, fontFamily: 'Quicksand')),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              top: 20, left: 30, bottom: 20, right: 30),
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
                          child: Column(
                            children: [
                              Text('Tomate',
                                  style: TextStyle(
                                      fontSize: 17, fontFamily: 'Quicksand')),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Wrap(
                  children: [
                    Text('Temps de préparation : ',
                        style:
                            TextStyle(fontSize: 17, fontFamily: 'Quicksand')),
                    Text('15 min',
                        style: TextStyle(fontSize: 17, fontFamily: 'Quicksand'))
                  ],
                ),
                SizedBox(
                  height: 90,
                ),
              ],
            ),
          ),
        ),

        // Bouton fixe en bas de l'écran

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
              // color: Colors.orange,
              child: ElevatedButton(
                onPressed: () {
                  // Action à effectuer quand le bouton est pressé
                  print("Ajouté au panier");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFF7F00),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(
                  'Ajouter au panier',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
