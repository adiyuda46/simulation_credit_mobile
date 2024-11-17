import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simulation_credit/main.dart';
import 'package:simulation_credit/views/cubits/cat_motorbaru_cubit.dart';
import 'package:simulation_credit/views/cubits/price_motorbaru_cubit.dart';
import 'package:simulation_credit/views/cubits/simulasi_cubit.dart';
import 'package:simulation_credit/views/cubits/var_motorbaru_cubit.dart';
import 'package:simulation_credit/views/screens/motorBaru_page.dart';
import 'package:simulation_credit/views/screens/testingPage.dart';

class ListProduct extends StatefulWidget {
  const ListProduct({super.key});

  @override
  State<ListProduct> createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
           GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => getIt<CatMotorBaruCubit>()),
            BlocProvider(create: (context) => getIt<VarMotorBaruCubit>()),
            BlocProvider(create: (context) => getIt<PriceMotorBaruCubit>()),
            BlocProvider(create: (context) => getIt<SimulasiCubit>()),
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
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/mobil.jpg'))),
            ),
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/mp.jpg'))),
            ),
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/motor.png'))),
            ),
          ],
        ),
      ),
    );
  }
}
