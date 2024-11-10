import 'package:flutter/material.dart';

class BannerImage extends StatefulWidget {
  const BannerImage({super.key});

  @override
  State<BannerImage> createState() => _BannerImageState();
}

class _BannerImageState extends State<BannerImage> {
  final List<String> ListImage = [
    'assets/images/mp.jpg',
    'assets/images/mobil.jpg',
    'assets/images/motor.png'
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 150,
              width: 250,
              color: Colors.amber,
            ),
            SizedBox(width: 16.0), // Add 16 pixel spacing
            Container(
              height: 150,
              width: 250,
              color: Colors.blueAccent,
            ),
            SizedBox(width: 16.0), // Add 16 pixel spacing
            Container(
              height: 150,
              width: 250,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}