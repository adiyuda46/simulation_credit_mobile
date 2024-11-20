import 'package:flutter/material.dart';
import 'package:simulation_credit/views/widget/banner.dart';
import 'package:simulation_credit/views/widget/lob.dart';
import 'package:simulation_credit/views/widget/navigate.dart';

import '../../core/utils/text.dart';
import '../widget/widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Center(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    height: 50,
                    width: 130,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/logobaf.png'),
                          fit: BoxFit.fill),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text("hai, BAF Frends", style: TextStyles.h3),
                ),
              ),
              const SizedBox(height: 65),
              // list agrment
              InformasiCicilanWidget(),
              const SizedBox(height: 65),
              // product
              Lob(),
              const SizedBox(height: 40),

              BannerImage(),
              const SizedBox(height: 20),
              NavigatePage()
            ],
          ),
        ),
      ),
    );
  }
}
