import 'package:flutter/material.dart';
import 'package:simulation_credit/core/utils/colors/colors.dart';
import 'package:simulation_credit/views/screens/home_page.dart';
import 'package:simulation_credit/views/widget/dropDwon.dart';
import 'package:simulation_credit/views/widget/listProduct.dart';
import 'package:simulation_credit/views/widget/navigate.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => HomePage()), // Navigate to HomePage
            );
          },
        ),
        centerTitle: true,
        title: const Text(
          "Product",
          style: TextStyle(color: ColorUtil.putih),
        ),
        backgroundColor: ColorUtil.primaryColor,
      ),
      body: Column(
        children: [
          ListProduct(),
          const SizedBox(height: 22),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 140,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/banner3.png'), // Add your image here
                  fit: BoxFit.cover, // Adjust the image to cover the container
                ),
                borderRadius:
                    BorderRadius.circular(8.0), // Optional: Add rounded corners
              ),
            ),
          ),
          const SizedBox(height: 30),
          DropdownSection(),
          const SizedBox(height: 5),
          NavigatePage()
        ],
      ),
    );
  }
}
