import 'package:flutter/material.dart';
import 'package:simulation_credit/core/utils/colors/colors.dart';
import 'package:simulation_credit/views/screens/home_page.dart';

import '../screens/product.dart';

class NavigatePage extends StatefulWidget {
  const NavigatePage({super.key});

  @override
  State<NavigatePage> createState() => _NavigatePageState();
}

class _NavigatePageState extends State<NavigatePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        border: BorderDirectional(
          top: BorderSide(
            color: Colors.black,
            width: 1.0,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
            icon: Icon(
              Icons.home,
              size: 35,
              color: ColorUtil.primaryColor,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductPage()),
              );
            },
            icon: Icon(Icons.business_center,
                size: 35, color: ColorUtil.primaryColor),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.person, size: 35, color: ColorUtil.primaryColor),
          ),
        ],
      ),
    );
  }
}
