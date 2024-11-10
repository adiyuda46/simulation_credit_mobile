import 'package:flutter/material.dart';
import 'package:simulation_credit/core/utils/colors/colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed, // Mengubah dari navigatePage ke onPressed
  });

  final String label;
  final VoidCallback onPressed; // Menggunakan VoidCallback

  @override
  Widget build(BuildContext context) {
    // Set ukuran layar
    final screenSize = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: screenSize.height * 0.07,
          width: screenSize.width * 0.8,
          child: ElevatedButton(
            onPressed: onPressed, // Menggunakan onPressed
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorUtil.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              label,
              style: const TextStyle(color: ColorUtil.putih, fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }
}

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    // set ukuran layar
    final screenSize = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          //color: Colors.amber,
          height: screenSize.height * 0.07,
          width: screenSize.width * 0.8,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: ColorUtil.putih,
                side: const BorderSide(color: ColorUtil.primaryColor),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            child: Text(
              label,
              style: const TextStyle(color: ColorUtil.text, fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }
}
