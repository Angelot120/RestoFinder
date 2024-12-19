import 'package:flutter/material.dart';
import 'package:restofinder/domain/entities/Restaurant.dart';
import 'package:restofinder/presentation/widgets/restaurant_detail_silver.dart';
import 'package:restofinder/presentation/widgets/restaurant_info.dart';

class RestaurantDetailsScreen extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantDetailsScreen({
    super.key,
    required this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: RestaurantDetailSilver(
              restaurant: restaurant,
              expandedHeight: 360,
              roundedContainerHeight: 30,
            ),
          ),
          SliverToBoxAdapter(
            child: RestaurantInfo(restaurant: restaurant),
          )
        ],
      ),
    );
  }
}
