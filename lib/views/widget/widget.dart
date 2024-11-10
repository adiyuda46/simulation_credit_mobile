import 'package:flutter/material.dart';

class InformasiCicilanWidget extends StatefulWidget {
  const InformasiCicilanWidget({Key? key}) : super(key: key);

  @override
  State<InformasiCicilanWidget> createState() => _InformasiCicilanWidgetState();
}

class _InformasiCicilanWidgetState extends State<InformasiCicilanWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Stack(
        children: [

          
          // Main container with border
          Container(
            height: 120,
            width: 320,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blue.shade300,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),
          ),
          
          // Header "Informasi Cicilan"
          Container(
            height: 30,
            width: 320,
            decoration: BoxDecoration(
              color: Colors.blue.shade500,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(14),
                topRight: Radius.circular(14),
                //bottomRight: Radius.circular(14),
              ),
            ),
            child: Center(
              child: const Text(
                'Informasi Cicilan',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          
          // Content with icon and text
          Positioned(
            top: 50,
            left: 20,
            child: Row(
              children: [
                Icon(
                  Icons.edit_document,
                  color: Colors.blue.shade500,
                  size: 32,
                ),
                const SizedBox(width: 16),
                Text(
                  'belum ada agreement',
                  style: TextStyle(
                    color: Colors.blue.shade900,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}