import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(50),
          child: Center(
              child: Padding(
                padding: const EdgeInsets.all(50),
                child: Container(
                    color: Colors.white,
                    child: Lottie.asset('assets/json/Loading.json')),
              )),
        ));
  }
}
