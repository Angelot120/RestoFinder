import 'package:flutter/material.dart';
import 'package:restofinder/presentation/widgets/card_item.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 8, right: 8, bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Ajouter un alignement
          children: [
            // Header avec retour
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context)
                    .padding
                    .top, // Ajuster pour éviter que ça se chevauche avec la barre de statut
                left: 25,
                right: 30,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
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
                  SizedBox(width: 20), // Ajouter un espacement
                  Text(
                    'Panier',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontFamily: 'Baloo',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),

            // CardItems
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
            SizedBox(height: 30),

            // Container pour le bouton "Commander"
            Padding(
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
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // Centrer le texte
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
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
