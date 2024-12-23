import 'package:flutter/material.dart';
import 'package:restofinder/domain/entities/Restaurant.dart';

class RestaurantDetailSilver extends SliverPersistentHeaderDelegate {
  final Restaurant restaurant;
  final double expandedHeight;
  final double roundedContainerHeight;
  const RestaurantDetailSilver(
      {required this.restaurant,
      required this.expandedHeight,
      required this.roundedContainerHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      children: [
        Container(color: Color(0xFFF0F0F0)),
        Hero(
          tag: restaurant.name,

          // child: Image.network(
          //   restaurant.photos[
          //       0], // Utilisation de Image.network pour les images en ligne
          //   width: MediaQuery.of(context).size.width,
          //   height:
          //       expandedHeight, // ajustez cette valeur selon la taille souhaitée
          //   fit: BoxFit.cover, // L'image s'adapte à l'espace disponible
          //   loadingBuilder: (context, child, loadingProgress) {
          //     if (loadingProgress == null) {
          //       return child; // Affiche l'image une fois qu'elle est chargée
          //     } else {
          //       return Center(
          //         child: CircularProgressIndicator(
          //           value: loadingProgress.expectedTotalBytes != null
          //               ? loadingProgress.cumulativeBytesLoaded /
          //                   (loadingProgress.expectedTotalBytes ?? 1)
          //               : null,
          //         ),
          //       ); // Affiche la barre de progression pendant le chargement
          //     }
          //   },
          //   errorBuilder: (context, error, stackTrace) {
          //     return Center(child: Icon(Icons.error, color: Color(0xFFFF7F00)));
          //     // Affiche une erreur si l'image ne se charge pas
          //   },
          // ),

          child: Image.asset(
            restaurant.photos[
                0], // Utilisation de Image.asset pour les images locales
            width: MediaQuery.of(context).size.width,
            height: expandedHeight,
            fit: BoxFit.cover, // L'image s'adapte à l'espace disponible
          ),
        ),
        Positioned(
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              margin: EdgeInsets.only(
                // top: MediaQuery.of(context).padding.top,
                top: 10,
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
        ),
        Positioned(
          top: expandedHeight - roundedContainerHeight - shrinkOffset,
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: roundedContainerHeight,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Container(
              alignment: Alignment.center,
              width: 60,
              height: 5,
              color: Color(0xFFFF7F00),
            ),
          ),
        )
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => 0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
