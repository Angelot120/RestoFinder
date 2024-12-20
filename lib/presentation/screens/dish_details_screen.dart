import 'package:flutter/material.dart';
import 'package:restofinder/domain/entities/Restaurant.dart';
// import 'package:restofinder/domain/entities/Dish.dart';
import 'package:restofinder/presentation/widgets/dish_detail_silver.dart';
import 'package:restofinder/presentation/widgets/dish_info.dart';

class DishDetailsScreen extends StatelessWidget {
  final Dish dish;

  const DishDetailsScreen({super.key, required this.dish});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: DishDetailSilver(
              dish: dish,
              expandedHeight: 360,
              roundedContainerHeight: 30,
            ),
          ),
          SliverToBoxAdapter(
            child: DishInfo(dish: dish),
          )
        ],
      ),
    );
  }
}
