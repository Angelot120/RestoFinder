import 'package:flutter/material.dart';
import 'package:restofinder/presentation/widgets/banner_session.dart';
import 'package:restofinder/presentation/widgets/home_app_bar.dart';
import 'package:restofinder/presentation/widgets/home_search.dart';
import 'package:restofinder/presentation/widgets/restaurant_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        // Garder SingleChildScrollView pour le défilement
        child: Column(
          children: [
            HomeAppBar(),
            BannerSession(),
            SearchSection(),
            RestaurantListScreen(),
          ],
        ),
      ),
    );
  }
}
