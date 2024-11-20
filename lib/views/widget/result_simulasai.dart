import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:simulation_credit/core/utils/colors/colors.dart';
import 'package:simulation_credit/main.dart';
import 'package:simulation_credit/views/cubits/submit_cubit.dart';
import 'package:simulation_credit/views/screens/home_page.dart';
import 'package:simulation_credit/views/screens/testingPage.dart';

class ResultSimulasi extends StatelessWidget {
  final String cicilanBulanan;
  final String totalDownPayment;
  final String dp;
  final String tenor;
  final String typeProduct;
  final String totalAmount;

  const ResultSimulasi({
    Key? key,
    required this.cicilanBulanan,
    required this.totalDownPayment,
    required this.dp,
    required this.tenor,
    required this.typeProduct,
    required this.totalAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => getIt<SubmitSimulationCubit>(),
      child: BlocBuilder<SubmitSimulationCubit, SubmitSimulationState>(
    
          builder: (context, state) {
            return Container(
              padding: const EdgeInsets.all(23),
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorUtil.grey,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Estimasi Cicilan Bulanan Anda",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Rp. $cicilanBulanan",
                      style: const TextStyle(
                          color: ColorUtil.text,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const Text("/Bulan"),
                    const SizedBox(height: 10),
                    Text(
                      "Uang Muka Rp. $totalDownPayment",
                      style: const TextStyle(
                          color: ColorUtil.primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Perhitungan hanya bersifat simulasi, dapat berubah sesuai regulasi BAF. Ajukan aplikasi pembiayaan.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        context.read<SubmitSimulationCubit>().submitSimulasi(
                              cicilanBulanan,
                              typeProduct,
                              tenor,
                              totalAmount,
                            );
    
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: ColorUtil.primaryColor,
                        onPrimary: ColorUtil.putih,
                        minimumSize: const Size(200, 30),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text("Ajukan Sekarang"),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
    );
  }
}
