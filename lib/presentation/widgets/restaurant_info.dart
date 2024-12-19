import 'package:flutter/material.dart';
import 'package:restofinder/domain/entities/Restaurant.dart';

class RestaurantInfo extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantInfo({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        children: [
          Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    'Resto gastro le gourmet',
                    style: TextStyle(fontSize: 30),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Color(0xFFFF7F00),
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.white,
                      ),
                      Text(
                        '4.5',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  ),
                )
              ]),
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
          Row(
            children: [
              const Icon(Icons.location_on, color: Color(0xFFFF7F00)),
              Container(
                margin: EdgeInsets.all(5),
                child: Text(
                    style: TextStyle(fontSize: 12, fontFamily: 'Quicksand'),
                    '12 rue de Lias, 75012 Paris, France'),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              const Icon(Icons.phone, color: Color(0xFFFF7F00)),
              Container(
                margin: EdgeInsets.all(5),
                child: Text(
                    style: TextStyle(fontSize: 12, fontFamily: 'Quicksand'),
                    '12 rue de Lias, 75012 Paris, France'),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              const Icon(Icons.mail_outline, color: Color(0xFFFF7F00)),
              Container(
                margin: EdgeInsets.all(5),
                child: Text(
                    style: TextStyle(fontSize: 12, fontFamily: 'Quicksand'),
                    '12 rue de Lias, 75012 Paris, France'),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              const Icon(Icons.public, color: Color(0xFFFF7F00)),
              Container(
                margin: EdgeInsets.all(5),
                child: Text(
                    style: TextStyle(fontSize: 12, fontFamily: 'Quicksand'),
                    '12 rue de Lias, 75012 Paris, France'),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 300,
            decoration: BoxDecoration(
                color: Color(0xFFF0F0F0),
                borderRadius: BorderRadius.circular(20)),
          )
        ],
      ),
    );
  }
}
