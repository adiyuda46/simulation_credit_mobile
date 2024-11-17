import 'package:flutter/material.dart';
import 'package:simulation_credit/core/utils/colors/colors.dart';

class ResultSimulasi extends StatelessWidget {
  final String cicilanBulanan;

  final String totalDownPayment;

  const ResultSimulasi(
      {super.key,
      required this.cicilanBulanan,
      required this.totalDownPayment});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(23),
      height: 300,
      width: 300,
      decoration: BoxDecoration(
        color: ColorUtil.grey,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Estimasi Cicilan Bulanan Anda",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              "Rp. $cicilanBulanan",
              style: const TextStyle(
                  color: ColorUtil.text,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const Text("/Bulan"),
            const SizedBox(height: 10),
            Text(
              "Uang Mukan Rp. $totalDownPayment",
              style: const TextStyle(
                  color: ColorUtil.primaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              "Perhitungan hanya bersifat simulasi, dapat berubah sesuai regulasi BAF Ajukan Aplikasi pemmbiayaan",
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: ColorUtil.primaryColor,
                  onPrimary: ColorUtil.putih,
                  minimumSize: const Size(200, 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text("Ajukan Sekarang"))
          ],
        ),
      ),
    );
  }
}
