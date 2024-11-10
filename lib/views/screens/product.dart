import 'package:flutter/material.dart';
import 'package:simulation_credit/core/utils/colors/colors.dart';
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
            Navigator.of(context).pop();
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
              color: Colors.blueAccent,
            ),
          ),
          const SizedBox(height: 30),
          DropdownSection(),
          ElevatedButton(
                      onPressed: () {
                      },
                      style: ElevatedButton.styleFrom(
                        primary: ColorUtil.primaryColor,
                        onPrimary: ColorUtil.putih,
                        minimumSize: const Size(250, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Ajukan Sekarang'),
                    ),
          const SizedBox(height: 5),
          NavigatePage()
        ],
      ),
    );
  }
}
