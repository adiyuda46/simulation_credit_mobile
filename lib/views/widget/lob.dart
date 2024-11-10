import 'package:flutter/material.dart';

class Lob extends StatefulWidget {
  const Lob({super.key});

  @override
  State<Lob> createState() => _LobState();
}

class _LobState extends State<Lob> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/motor.png'))),
              ),
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/mobil.jpg'))),
              ),
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/mp.jpg'))),
              ),
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/motor.png'))),
              ),
            ],
          ),
          
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Motor Yamaha"),
              Text("Mobil Baru"),
              Text("Multi Produk"),
              Text("Motor Bekas"),
            ],
          ),
        )
      ],
    );
  }
}
