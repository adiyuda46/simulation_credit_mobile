import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:simulation_credit/core/injection/injection.dart';
import 'package:simulation_credit/data/datasources/local/shared_preferences_datasource.dart';
import 'package:simulation_credit/data/datasources/remote/accountDetail_datasource.dart';
import 'package:simulation_credit/data/datasources/remote/agrement_datasource.dart';
import 'package:simulation_credit/data/datasources/remote/auth_datasource.dart';
import 'package:simulation_credit/data/datasources/remote/cat_mobil_datasource.dart';
import 'package:simulation_credit/data/datasources/remote/cat_motorbaru_datasource.dart';
import 'package:simulation_credit/data/datasources/remote/cat_mp_datasource.dart';
import 'package:simulation_credit/data/datasources/remote/price_mobil_datasource.dart';
import 'package:simulation_credit/data/datasources/remote/price_motorbaru_datasource.dart';
import 'package:simulation_credit/data/datasources/remote/price_mp_datasource.dart';
import 'package:simulation_credit/data/datasources/remote/register_datasource.dart';
import 'package:simulation_credit/data/datasources/remote/simulasi_datasource.dart';
import 'package:simulation_credit/data/datasources/remote/submit_datasource.dart';
import 'package:simulation_credit/data/datasources/remote/var_motorbaru_datasource.dart';
import 'package:simulation_credit/data/datasources/remote/var_mp_datasource.dart';
import 'package:simulation_credit/data/models/simulation_model.dart';
import 'package:simulation_credit/data/repositories/accountDetail_repository.dart';
import 'package:simulation_credit/data/repositories/agrment_repository.dart';
import 'package:simulation_credit/data/repositories/auth_repository.dart';
import 'package:simulation_credit/data/repositories/cat_motorbaru_repository.dart';
import 'package:simulation_credit/data/repositories/cat_mp_repository.dart';
import 'package:simulation_credit/data/repositories/price_mobil_repository.dart';
import 'package:simulation_credit/data/repositories/price_motorbaru_repository.dart';
import 'package:simulation_credit/data/repositories/price_mp_repository.dart';
import 'package:simulation_credit/data/repositories/register_repository.dart';
import 'package:simulation_credit/data/repositories/simulasi_repository.dart';
import 'package:simulation_credit/data/repositories/submit_repository.dart';
import 'package:simulation_credit/data/repositories/var_motorbaru_repository.dart';
import 'package:simulation_credit/data/repositories/var_mp_repository.dart';
import 'package:simulation_credit/views/cubits/agrement_cubit.dart';
import 'package:simulation_credit/views/cubits/cat_mobil_cubit.dart';
import 'package:simulation_credit/views/cubits/cat_motorbaru_cubit.dart';
import 'package:simulation_credit/views/cubits/login_cubit.dart';
import 'package:simulation_credit/views/cubits/price_mobil_cubit.dart';
import 'package:simulation_credit/views/cubits/price_motorbaru_cubit.dart';
import 'package:simulation_credit/views/cubits/price_mp_cubit.dart';
import 'package:simulation_credit/views/cubits/register_cubit.dart';
import 'package:simulation_credit/views/cubits/simulasi_cubit.dart';
import 'package:simulation_credit/views/cubits/submit_cubit.dart';
import 'package:simulation_credit/views/cubits/var_motorbaru_cubit.dart';
import 'package:simulation_credit/views/screens/login_page.dart';
import 'package:simulation_credit/views/screens/register_page.dart';

import 'data/datasources/remote/cat_motorBekas_datasource.dart';
import 'data/datasources/remote/price_motorBekas_datasource.dart';
import 'data/datasources/remote/var_mobil_datasource.dart';
import 'data/datasources/remote/var_motorBekas_datasource.dart';
import 'data/repositories/cat_mobil_repository.dart';
import 'data/repositories/cat_motorBekas_repository.dart';
import 'data/repositories/price_motorBekas_repository.dart';
import 'data/repositories/var_mobil_repository.dart';
import 'data/repositories/var_motorBekas_repository.dart';
import 'views/cubits/accountDetails_cubit.dart';
import 'views/cubits/cat_morotBekas_cubit.dart';
import 'views/cubits/cat_mp_cubit.dart';
import 'views/cubits/price_motorBekas_cubit.dart';
import 'views/cubits/var_mobil_cubit.dart';
import 'views/cubits/var_motorBekas_cubit.dart';
import 'views/cubits/var_mp_cubit.dart';

final GetIt getIt = GetIt.instance;

void setup() {
  // Register dependencies
  getIt.registerLazySingleton<SessionManager>(() => SessionManager());
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<AuthenticationDataSource>(() => AuthenticationDataSource());
  getIt.registerLazySingleton<RegisterDataSource>(() => RegisterDataSource());
  getIt.registerLazySingleton<CatMotorbaruDataSource>(() => CatMotorbaruDataSource());
  getIt.registerLazySingleton<VarMotorBaruDataSource>(() => VarMotorBaruDataSource());
  getIt.registerLazySingleton<PriceMotorBaruDataSource>(() => PriceMotorBaruDataSource());
  getIt.registerLazySingleton<SimulationDataSource>(() => SimulationDataSource());
  getIt.registerLazySingleton<SubmitDataSource>(() => SubmitDataSource());
  getIt.registerLazySingleton<AgreementDatasource>(() => AgreementDatasource());
  getIt.registerLazySingleton<CatMobilDatasource>(() => CatMobilDatasource());
  getIt.registerLazySingleton<VarMobilDataSource>(() => VarMobilDataSource());
  getIt.registerLazySingleton<PriceMobilDataSource>(() => PriceMobilDataSource());
  getIt.registerLazySingleton<CatMpDataSource>(() => CatMpDataSource());
  getIt.registerLazySingleton<VarMpDataSource>(() => VarMpDataSource());
  getIt.registerLazySingleton<PriceMpDataSource>(() => PriceMpDataSource());
  getIt.registerLazySingleton<CatMotorbekasDataSource>(() => CatMotorbekasDataSource());
  getIt.registerLazySingleton<VarMotorBekasDataSource>(() => VarMotorBekasDataSource());
  getIt.registerLazySingleton<PriceMotorBekasDataSource>(() => PriceMotorBekasDataSource());
  getIt.registerLazySingleton<AccountDetailsDatasource>(() => AccountDetailsDatasource());
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
  getIt.registerLazySingleton<PriceMotorBaruRepository>(() => PriceMotorBaruRepository(
    getIt<PriceMotorBaruDataSource>(),
    getIt<SessionManager>(),
    ));

  getIt.registerLazySingleton<SimulationRepository>(() => SimulationRepository(
    getIt<SimulationDataSource>(),
    getIt<SessionManager>(),
  ),);

getIt.registerLazySingleton<SubmitSimulationRepository>(() => SubmitSimulationRepository(
    getIt<SubmitDataSource>(),
    getIt<SessionManager>(),
  ),);
getIt.registerLazySingleton<AgrementRepository>(() => AgrementRepository(
    getIt<AgreementDatasource>(),
    getIt<SessionManager>(),
  ),);
    getIt.registerLazySingleton<CatMobilRepository>(() => CatMobilRepository(
    getIt<CatMobilDatasource>(),
    getIt<SessionManager>(),
  ));
  getIt.registerLazySingleton<VarMobilRepository>(() => VarMobilRepository(
    getIt<VarMobilDataSource>(),
     getIt<SessionManager>(),
  ));
  getIt.registerLazySingleton<PriceMobilRepository>(() => PriceMobilRepository(
    getIt<PriceMobilDataSource>(),
    getIt<SessionManager>(),
    ));
getIt.registerLazySingleton<CatMpRepository>(() => CatMpRepository(
    getIt<CatMpDataSource>(),
    getIt<SessionManager>(),
  ));
  getIt.registerLazySingleton<VarMpRepository>(() => VarMpRepository(
    getIt<VarMpDataSource>(),
     getIt<SessionManager>(),
  ));
  getIt.registerLazySingleton<PriceMpRepository>(() => PriceMpRepository(
    getIt<PriceMpDataSource>(),
    getIt<SessionManager>(),
    ));
     getIt.registerLazySingleton<CatMotorBekasRepository>(() => CatMotorBekasRepository(
    getIt<CatMotorbekasDataSource>(),
    getIt<SessionManager>(),
  ));

  getIt.registerLazySingleton<VarMotorBekasRepository>(() => VarMotorBekasRepository(
    getIt<VarMotorBekasDataSource>(),
     getIt<SessionManager>(),
  ));
  getIt.registerLazySingleton<PriceMotorBekasRepository>(() => PriceMotorBekasRepository(
    getIt<PriceMotorBekasDataSource>(),
    getIt<SessionManager>(),
    ));
    getIt.registerLazySingleton<AccountDetailRepository>(() => AccountDetailRepository(
    getIt<AccountDetailsDatasource>(),
    getIt<SessionManager>(),
    ));

  // Register cubits
  getIt.registerFactory(() => AuthCubit(getIt<AuthRepository>()));
  getIt.registerFactory(() => RegisterCubit(getIt<RegisterRepository>()));
  getIt.registerFactory(() => CatMotorBaruCubit(getIt<CatMotorBaruRepository>()));
  getIt.registerFactory(() => VarMotorBaruCubit(getIt<VarMotorBaruRepository>()));
  getIt.registerFactory(() => PriceMotorBaruCubit(getIt<PriceMotorBaruRepository>()));
  getIt.registerFactory(() => SimulasiCubit(getIt<SimulationRepository>()));
  getIt.registerFactory(() => SubmitSimulationCubit(getIt<SubmitSimulationRepository>()));
  getIt.registerFactory(() => AgrementCubit(getIt<AgrementRepository>()));
  getIt.registerFactory(() => CatMobilCubit(getIt<CatMobilRepository>()));
 getIt.registerFactory(() => VarMobilCubit(getIt<VarMobilRepository>()));
 getIt.registerFactory(() => PriceMobilCubit(getIt<PriceMobilRepository>()));
 getIt.registerFactory(() => CatMpCubit(getIt<CatMpRepository>()));
 getIt.registerFactory(() => VarMpCubit(getIt<VarMpRepository>()));
 getIt.registerFactory(() => PriceMpCubit(getIt<PriceMpRepository>()));
   getIt.registerFactory(() => CatMotorBekasCubit(getIt<CatMotorBekasRepository>()));
  getIt.registerFactory(() => VarMotorBekasCubit(getIt<VarMotorBekasRepository>()));
  getIt.registerFactory(() => PriceMotorBekasCubit(getIt<PriceMotorBekasRepository>()));
   getIt.registerFactory(() => AccountDetailCubit(getIt<AccountDetailRepository>()));
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
          // BlocProvider<CatMotorBaruCubit>(
          //   create: (context) => getIt<CatMotorBaruCubit>(),
          // ),
          // BlocProvider(
          //   create: (context) => getIt<VarMotorBaruCubit>(),
          // ),
          // BlocProvider(
          //   create: (context) => getIt<PriceMotorBaruCubit>(),
          //),
          BlocProvider(
            create: (context) => getIt<SimulasiCubit>(),
          ),
          BlocProvider(
            create: (context) => getIt<SubmitSimulationCubit>(),
          ),
           BlocProvider(
            create: (context) => getIt<AgrementCubit>(),
          ),
        ],
        child: const LoginPage(),
      ),
    );
  }
}