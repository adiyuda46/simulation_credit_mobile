import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simulation_credit/main.dart';
import 'package:simulation_credit/views/cubits/cat_motorbaru_cubit.dart';
import 'package:simulation_credit/views/cubits/price_motorbaru_cubit.dart';
import 'package:simulation_credit/views/cubits/var_motorbaru_cubit.dart';
import 'package:simulation_credit/views/screens/motorBaru_page.dart';
import 'package:simulation_credit/views/screens/testingPage.dart';

class ListProductForm extends StatefulWidget {
  final String currentPage; // Tambahkan parameter untuk halaman saat ini

  const ListProductForm({super.key, required this.currentPage});

  @override
  State<ListProductForm> createState() => _ListProductFormState();
}

class _ListProductFormState extends State<ListProductForm> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: widget.currentPage == 'motorBaru' ? null : () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MultiBlocProvider(
                      providers: [
                        BlocProvider(create: (context) => getIt<CatMotorBaruCubit>()),
                        BlocProvider(create: (context) => getIt<VarMotorBaruCubit>()),
                        BlocProvider(create: (context) => getIt<PriceMotorBaruCubit>()),
                      ],
                      child: MotorBaruPage(),
                    ),
                  ),
                );
              },
              child: Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/images/motor.png')),
                ),
              ),
            ),
            GestureDetector(
              onTap: widget.currentPage == 'mobil' ? null : () {
                // Navigasi ke halaman mobil
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MultiBlocProvider(
                      providers: [
                        BlocProvider(create: (context) => getIt<CatMotorBaruCubit>()),
                        BlocProvider(create: (context) => getIt<VarMotorBaruCubit>()),
                        BlocProvider(create: (context) => getIt<PriceMotorBaruCubit>()),
                      ],
                      child: MotorBaruPage(),
                    ),
                  ),
                );
              },
              child: Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/images/mobil.jpg')),
                ),
              ),
            ),
            GestureDetector(
              onTap: widget.currentPage == 'mp' ? null : () {
                // Navigasi ke halaman mp
              },
              child: Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/images/mp.jpg')),
                ),
              ),
            ),
            GestureDetector(
              onTap: widget.currentPage == 'motorBaru' ? null : () {
                // Navigasi ke halaman lain
              },
              child: Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/images/motor.png')),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}