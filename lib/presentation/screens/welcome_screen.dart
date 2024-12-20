import 'package:flutter/material.dart';
import 'package:restofinder/presentation/screens/home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Expanded(
            child: Image.asset(
              'assets/images/welcome-bg.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
              child: Image.asset(
            'assets/images/RestoFinder.png',
          )),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: () {
                    // Navigue vers l'écran HomeScreen lorsque le bouton est pressé
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      color: Color(0xFFFF7F00),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
