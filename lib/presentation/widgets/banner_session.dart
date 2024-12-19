import 'package:flutter/material.dart';

class BannerSession extends StatelessWidget {
  const BannerSession({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Hello,',
          style: TextStyle(color: Colors.grey, fontSize: 12),
        ),
        Wrap(
          children: [
            Text('Trouvez les ', style: TextStyle(fontSize: 30)),
            Text("Resto ",
                style: TextStyle(color: Color(0xFFFF7F00), fontSize: 30)),
            Text('les plus ', style: TextStyle(fontSize: 30)),
            Text("Proche ",
                style: TextStyle(color: Color(0xFFFF7F00), fontSize: 30)),
            Text("De vous en ", style: TextStyle(fontSize: 30)),
            Text("un clique.",
                style: TextStyle(color: Color(0xFFFF7F00), fontSize: 30)),
          ],
        )
      ],
    );
  }
}
