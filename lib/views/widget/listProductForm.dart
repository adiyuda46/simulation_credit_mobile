import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simulation_credit/main.dart';
import 'package:simulation_credit/views/cubits/cat_motorbaru_cubit.dart';
import 'package:simulation_credit/views/cubits/cat_mp_cubit.dart';
import 'package:simulation_credit/views/cubits/price_mobil_cubit.dart';
import 'package:simulation_credit/views/cubits/price_motorbaru_cubit.dart';
import 'package:simulation_credit/views/cubits/submit_cubit.dart';
import 'package:simulation_credit/views/cubits/var_motorbaru_cubit.dart';
import 'package:simulation_credit/views/screens/motorBaru_page.dart';
import 'package:simulation_credit/views/screens/multyproduct_page.dart';
import 'package:simulation_credit/views/screens/testingPage.dart';

import '../cubits/cat_mobil_cubit.dart';
import '../cubits/cat_morotBekas_cubit.dart';
import '../cubits/price_motorBekas_cubit.dart';
import '../cubits/price_mp_cubit.dart';
import '../cubits/simulasi_cubit.dart';
import '../cubits/var_mobil_cubit.dart';
import '../cubits/var_motorBekas_cubit.dart';
import '../cubits/var_mp_cubit.dart';
import '../screens/mobil_page.dart';
import '../screens/motorBekas_page.dart';

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
              onTap: widget.currentPage == 'motorBaru'
                  ? null
                  : () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MultiBlocProvider(
                            providers: [
                              BlocProvider(
                                  create: (context) =>
                                      getIt<CatMotorBaruCubit>()),
                              BlocProvider(
                                  create: (context) =>
                                      getIt<VarMotorBaruCubit>()),
                              BlocProvider(
                                  create: (context) =>
                                      getIt<PriceMotorBaruCubit>()),
                              BlocProvider(
                                  create: (context) => getIt<SimulasiCubit>()),
                              // BlocProvider(
                              //     create: (context) =>
                              //         getIt<SubmitSimulationCubit>()),
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
            GestureDetector(
              onTap: widget.currentPage == 'mobil'
                  ? null
                  : () {
                      // Navigasi ke halaman mobil
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MultiBlocProvider(
                            providers: [
                              BlocProvider(
                                  create: (context) => getIt<CatMobilCubit>()),
                              BlocProvider(
                                  create: (context) =>
                                      getIt<VarMobilCubit>()),
                              BlocProvider(
                                  create: (context) =>
                                      getIt<PriceMobilCubit>()),
                              BlocProvider(
                                  create: (context) => getIt<SimulasiCubit>()),
                              //BlocProvider(create: (context) => getIt<SubmitSimulationCubit>()),
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
                      image: AssetImage('assets/images/mobil.jpg')),
                ),
              ),
            ),
            GestureDetector(
              onTap: widget.currentPage == 'mp'
                  ? null
                  : () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MultiBlocProvider(
                            providers: [
                              BlocProvider(
                                  create: (context) =>
                                      getIt<CatMpCubit>()),
                              BlocProvider(
                                  create: (context) =>
                                      getIt<VarMpCubit>()),
                              BlocProvider(
                                  create: (context) =>
                                      getIt<PriceMpCubit>()),
                              BlocProvider(
                                  create: (context) => getIt<SimulasiCubit>()),
                              // BlocProvider(
                              //     create: (context) =>
                              //         getIt<SubmitSimulationCubit>()),
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
                      image: AssetImage('assets/images/mp.jpg')),
                ),
              ),
            ),
            GestureDetector(
              onTap: widget.currentPage == 'motorBekas'
                  ? null
                  : () {
                      // Navigasi ke halaman lain
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MultiBlocProvider(
                            providers: [
                              BlocProvider(
                                  create: (context) =>
                                      getIt<CatMotorBekasCubit>()),
                              BlocProvider(
                                  create: (context) =>
                                      getIt<VarMotorBekasCubit>()),
                              BlocProvider(
                                  create: (context) =>
                                      getIt<PriceMotorBekasCubit>()),
                              BlocProvider(
                                  create: (context) => getIt<SimulasiCubit>()),
                              // BlocProvider(
                              //     create: (context) =>
                              //         getIt<SubmitSimulationCubit>()),
                            ],
                            child: MotorBekasPage(),
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
          ],
        ),
      ),
    );
  }
}
