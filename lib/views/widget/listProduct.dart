import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simulation_credit/main.dart';
import 'package:simulation_credit/views/cubits/cat_motorbaru_cubit.dart';
import 'package:simulation_credit/views/cubits/cat_mp_cubit.dart';
import 'package:simulation_credit/views/cubits/price_mobil_cubit.dart';
import 'package:simulation_credit/views/cubits/price_motorbaru_cubit.dart';
import 'package:simulation_credit/views/cubits/simulasi_cubit.dart';
import 'package:simulation_credit/views/cubits/var_motorbaru_cubit.dart';
import 'package:simulation_credit/views/screens/mobil_page.dart';
import 'package:simulation_credit/views/screens/motorBaru_page.dart';
import 'package:simulation_credit/views/screens/testingPage.dart';

import '../cubits/cat_mobil_cubit.dart';
import '../cubits/price_mp_cubit.dart';
import '../cubits/var_mobil_cubit.dart';
import '../cubits/var_mp_cubit.dart';
import '../screens/multyproduct_page.dart';

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
            // motor baru
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MultiBlocProvider(
                      providers: [
                        BlocProvider(
                            create: (context) => getIt<CatMotorBaruCubit>()),
                        BlocProvider(
                            create: (context) => getIt<VarMotorBaruCubit>()),
                        BlocProvider(
                            create: (context) => getIt<PriceMotorBaruCubit>()),
                        BlocProvider(
                            create: (context) => getIt<SimulasiCubit>()),
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
                  image: DecorationImage(
                      image: AssetImage('assets/images/motor.png')),
                ),
              ),
            ),
            // mobil
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MultiBlocProvider(
                      providers: [
                        BlocProvider(
                            create: (context) => getIt<CatMobilCubit>()),
                        BlocProvider(
                            create: (context) => getIt<VarMobilCubit>()),
                        BlocProvider(
                            create: (context) => getIt<PriceMobilCubit>()),
                        BlocProvider(
                            create: (context) => getIt<SimulasiCubit>()),
                      ],
                      child: MobilPage(),
                    ),
                  ),
                );
              },
              child: Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/mobil.jpg'))),
              ),
            ),
            // MP
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MultiBlocProvider(
                      providers: [
                        BlocProvider(
                            create: (context) => getIt<CatMpCubit>()),
                        BlocProvider(
                            create: (context) => getIt<VarMpCubit>()),
                        BlocProvider(
                            create: (context) => getIt<PriceMpCubit>()),
                        BlocProvider(
                            create: (context) => getIt<SimulasiCubit>()),
                      ],
                      child: MultyproductPage(),
                    ),
                  ),
                );
              },
              child: Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/mp.jpg'))),
              ),
            ),
            // motor bekas
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
