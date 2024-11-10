import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:simulation_credit/core/injection/injection.dart';
import 'package:simulation_credit/data/datasources/local/shared_preferences_datasource.dart';
import 'package:simulation_credit/data/datasources/remote/auth_datasource.dart';
import 'package:simulation_credit/data/datasources/remote/cat_motorbaru_datasource.dart';
import 'package:simulation_credit/data/datasources/remote/register_datasource.dart';
import 'package:simulation_credit/data/datasources/remote/var_motorbaru_datasource.dart';
import 'package:simulation_credit/data/repositories/auth_repository.dart';
import 'package:simulation_credit/data/repositories/cat_motorbaru_repository.dart';
import 'package:simulation_credit/data/repositories/register_repository.dart';
import 'package:simulation_credit/data/repositories/var_motorbaru_repository.dart';
import 'package:simulation_credit/views/cubits/cat_motorbaru_cubit.dart';
import 'package:simulation_credit/views/cubits/login_cubit.dart';
import 'package:simulation_credit/views/cubits/register_cubit.dart';
import 'package:simulation_credit/views/cubits/var_motorbaru_cubit.dart';
import 'package:simulation_credit/views/screens/login_page.dart';
import 'package:simulation_credit/views/screens/register_page.dart';

final GetIt getIt = GetIt.instance;

void setup() {
  // Register dependencies
  getIt.registerLazySingleton<SessionManager>(() => SessionManager());
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<AuthenticationDataSource>(() => AuthenticationDataSource());
  getIt.registerLazySingleton<RegisterDataSource>(() => RegisterDataSource());
  getIt.registerLazySingleton<CatMotorbaruDataSource>(() => CatMotorbaruDataSource());
  getIt.registerLazySingleton<VarMotorBaruDataSource>(() => VarMotorBaruDataSource());

  // Register repositories
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepository(
    getIt<SessionManager>(),
    getIt<AuthenticationDataSource>(),
  ));

  getIt.registerLazySingleton<RegisterRepository>(() => RegisterRepository(
    getIt<RegisterDataSource>(),
    getIt<SessionManager>(),
  ));

  getIt.registerLazySingleton<CatMotorBaruRepository>(() => CatMotorBaruRepository(
    getIt<CatMotorbaruDataSource>(),
    getIt<SessionManager>(),
  ));

  getIt.registerLazySingleton<VarMotorBaruRepository>(() => VarMotorBaruRepository(
    getIt<VarMotorBaruDataSource>(),
     getIt<SessionManager>(),
    ));

  // Register cubits
  getIt.registerFactory(() => AuthCubit(getIt<AuthRepository>()));
  getIt.registerFactory(() => RegisterCubit(getIt<RegisterRepository>()));
  getIt.registerFactory(() => CatMotorBaruCubit(getIt<CatMotorBaruRepository>()));
  getIt.registerFactory(() => VarMotorBaruCubit(getIt<VarMotorBaruRepository>()));
}

void main() {
  setup(); // Call setup to register dependencies
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Clean Code Example',
      home: MultiBlocProvider(
        providers: [
          BlocProvider<AuthCubit>(
            create: (context) => getIt<AuthCubit>(),
          ),
          BlocProvider<RegisterCubit>(
            create: (context) => getIt<RegisterCubit>(),
          ),
          BlocProvider<CatMotorBaruCubit>(
            create: (context) => getIt<CatMotorBaruCubit>(),
          ),
          BlocProvider(
            create: (context) => getIt<VarMotorBaruCubit>(),
          )
        ],
        child: const LoginPage(),
      ),
    );
  }
}