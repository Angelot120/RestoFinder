import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return (Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
          left: 25,
          right: 25,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50,
                  width: 50,
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
                  padding: EdgeInsets.all(0),
                  child: Image.asset(
                    'assets/images/shopping_cart.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 50,
                  width: 50,
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
                  padding: EdgeInsets.all(10),
                  child: const Icon(
                    Icons.shopping_cart,
                    color: Color(0xFFFF7F00),
                    size: 25,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
          ],
        )));
  }
}