import 'package:flutter/material.dart';
import 'package:restofinder/presentation/widgets/card_item.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Positioned(
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: Container(
                            margin: EdgeInsets.only(
                              top: MediaQuery.of(context).padding.top,
                              left: 25,
                              right: 30,
                            ),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 2),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(
                              Icons.arrow_back,
                              color: Color(0xFFFF7F00),
                            ),
                          ),
                        ),
          
                        Container(
                            child: Text(
                          'Panier',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontFamily: 'Baloo'),
                        )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(right: 60, left: 60, top: 30),
                child: CardItem(),
              ),
              Padding(
                padding: EdgeInsets.only(right: 60, left: 60, top: 30),
                child: CardItem(),
              ),
              Padding(
                padding: EdgeInsets.only(right: 60, left: 60, top: 30),
                child: CardItem(),
              ),
              SizedBox(
                height: 30,
              ),
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
                        child: Wrap(
                          children: [
                            Text(
                              "\$180 - ",
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            ),
                            Text(
                              'Commander',
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ],
                        )),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
