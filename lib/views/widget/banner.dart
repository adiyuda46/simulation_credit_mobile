import 'package:flutter/material.dart';

class BannerImage extends StatefulWidget {
  const BannerImage({super.key});

  @override
  State<BannerImage> createState() => _BannerImageState();
}

class _BannerImageState extends State<BannerImage> {
  final List<String> listImage = [
   // 'assets/images/banner1.png',
    'assets/images/banner4.png', 
    'assets/images/banner5.png',  // Added new image
    'assets/images/banner3.png'  // Added new image
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: listImage.map((imagePath) {
            return Container(
              height: 150,
              width: 250,
              margin: const EdgeInsets.symmetric(horizontal: 8.0), // Add horizontal margin
              decoration: BoxDecoration(
                //color: Colors.amber, // Background color in case the image doesn't load
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.fill, // Use BoxFit.cover to maintain aspect ratio
                ),
                borderRadius: BorderRadius.circular(8.0), // Optional: Add rounded corners
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
