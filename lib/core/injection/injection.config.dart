// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i11;

import '../../data/datasources/local/shared_preferences_datasource.dart'
    as _i10;
import '../../data/datasources/remote/agrement_datasource.dart' as _i3;
import '../../data/datasources/remote/auth_datasource.dart' as _i4;
import '../../data/datasources/remote/cat_mobil_datasource.dart' as _i5;
import '../../data/datasources/remote/cat_motorbaru_datasource.dart' as _i6;
import '../../data/datasources/remote/price_mobil_datasource.dart' as _i7;
import '../../data/datasources/remote/price_motorbaru_datasource.dart' as _i8;
import '../../data/datasources/remote/register_datasource.dart' as _i9;
import '../../data/datasources/remote/simulasi_datasource.dart' as _i12;
import '../../data/datasources/remote/submit_datasource.dart' as _i14;
import '../../data/datasources/remote/var_mobil_datasource.dart' as _i16;
import '../../data/datasources/remote/var_motorbaru_datasource.dart' as _i18;
import '../../data/repositories/agrment_repository.dart' as _i20;
import '../../data/repositories/auth_repository.dart' as _i21;
import '../../data/repositories/cat_mobil_repository.dart' as _i22;
import '../../data/repositories/cat_motorbaru_repository.dart' as _i23;
import '../../data/repositories/price_mobil_repository.dart' as _i24;
import '../../data/repositories/price_motorbaru_repository.dart' as _i25;
import '../../data/repositories/register_repository.dart' as _i26;
import '../../data/repositories/simulasi_repository.dart' as _i13;
import '../../data/repositories/submit_repository.dart' as _i15;
import '../../data/repositories/var_mobil_repository.dart' as _i17;
import '../../data/repositories/var_motorbaru_repository.dart' as _i19;
import '../../views/cubits/agrement_cubit.dart' as _i31;
import '../../views/cubits/cat_mobil_cubit.dart' as _i33;
import '../../views/cubits/cat_motorbaru_cubit.dart' as _i34;
import '../../views/cubits/login_cubit.dart' as _i32;
import '../../views/cubits/price_mobil_cubit.dart' as _i35;
import '../../views/cubits/price_motorbaru_cubit.dart' as _i36;
import '../../views/cubits/register_cubit.dart' as _i37;
import '../../views/cubits/simulasi_cubit.dart' as _i27;
import '../../views/cubits/submit_cubit.dart' as _i28;
import '../../views/cubits/var_mobil_cubit.dart' as _i29;
import '../../views/cubits/var_motorbaru_cubit.dart' as _i30;
import 'register_module.dart' as _i38;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> $initGetIt({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i3.AgreementDatasource>(() => _i3.AgreementDatasource());
    gh.factory<_i4.AuthenticationDataSource>(
        () => _i4.AuthenticationDataSource());
    gh.factory<_i5.CatMobilDatasource>(() => _i5.CatMobilDatasource());
    gh.factory<_i6.CatMotorbaruDataSource>(() => _i6.CatMotorbaruDataSource());
    gh.factory<_i7.PriceMobilDataSource>(() => _i7.PriceMobilDataSource());
    gh.factory<_i8.PriceMotorBaruDataSource>(
        () => _i8.PriceMotorBaruDataSource());
    gh.factory<_i9.RegisterDataSource>(() => _i9.RegisterDataSource());
    gh.singleton<_i10.SessionManager>(() => _i10.SessionManager());
    await gh.lazySingletonAsync<_i11.SharedPreferences>(
      () => registerModule.sharedPreferences,
      preResolve: true,
    );
    gh.factory<_i12.SimulationDataSource>(() => _i12.SimulationDataSource());
    gh.factory<_i13.SimulationRepository>(() => _i13.SimulationRepository(
          gh<_i12.SimulationDataSource>(),
          gh<_i10.SessionManager>(),
        ));
    gh.factory<_i14.SubmitDataSource>(() => _i14.SubmitDataSource());
    gh.factory<_i15.SubmitSimulationRepository>(
        () => _i15.SubmitSimulationRepository(
              gh<_i14.SubmitDataSource>(),
              gh<_i10.SessionManager>(),
            ));
    gh.factory<_i16.VarMobilDataSource>(() => _i16.VarMobilDataSource());
    gh.factory<_i17.VarMobilRepository>(() => _i17.VarMobilRepository(
          gh<_i16.VarMobilDataSource>(),
          gh<_i10.SessionManager>(),
        ));
    gh.factory<_i18.VarMotorBaruDataSource>(
        () => _i18.VarMotorBaruDataSource());
    gh.factory<_i19.VarMotorBaruRepository>(() => _i19.VarMotorBaruRepository(
          gh<_i18.VarMotorBaruDataSource>(),
          gh<_i10.SessionManager>(),
        ));
    gh.factory<_i20.AgrementRepository>(() => _i20.AgrementRepository(
          gh<_i3.AgreementDatasource>(),
          gh<_i10.SessionManager>(),
        ));
    gh.factory<_i21.AuthRepository>(() => _i21.AuthRepository(
          gh<_i10.SessionManager>(),
          gh<_i4.AuthenticationDataSource>(),
        ));
    gh.factory<_i22.CatMobilRepository>(() => _i22.CatMobilRepository(
          gh<_i5.CatMobilDatasource>(),
          gh<_i10.SessionManager>(),
        ));
    gh.factory<_i23.CatMotorBaruRepository>(() => _i23.CatMotorBaruRepository(
          gh<_i6.CatMotorbaruDataSource>(),
          gh<_i10.SessionManager>(),
        ));
    gh.factory<_i24.PriceMobilRepository>(() => _i24.PriceMobilRepository(
          gh<_i7.PriceMobilDataSource>(),
          gh<_i10.SessionManager>(),
        ));
    gh.factory<_i25.PriceMotorBaruRepository>(
        () => _i25.PriceMotorBaruRepository(
              gh<_i8.PriceMotorBaruDataSource>(),
              gh<_i10.SessionManager>(),
            ));
    gh.factory<_i26.RegisterRepository>(() => _i26.RegisterRepository(
          gh<_i9.RegisterDataSource>(),
          gh<_i10.SessionManager>(),
        ));
    gh.factory<_i27.SimulasiCubit>(
        () => _i27.SimulasiCubit(gh<_i13.SimulationRepository>()));
    gh.factory<_i28.SubmitSimulationCubit>(() =>
        _i28.SubmitSimulationCubit(gh<_i15.SubmitSimulationRepository>()));
    gh.factory<_i29.VarMobilCubit>(
        () => _i29.VarMobilCubit(gh<_i17.VarMobilRepository>()));
    gh.factory<_i30.VarMotorBaruCubit>(
        () => _i30.VarMotorBaruCubit(gh<_i19.VarMotorBaruRepository>()));
    gh.factory<_i31.AgrementCubit>(
        () => _i31.AgrementCubit(gh<_i20.AgrementRepository>()));
    gh.factory<_i32.AuthCubit>(() => _i32.AuthCubit(gh<_i21.AuthRepository>()));
    gh.factory<_i33.CatMobilCubit>(
        () => _i33.CatMobilCubit(gh<_i22.CatMobilRepository>()));
    gh.factory<_i34.CatMotorBaruCubit>(
        () => _i34.CatMotorBaruCubit(gh<_i23.CatMotorBaruRepository>()));
    gh.factory<_i35.PriceMobilCubit>(
        () => _i35.PriceMobilCubit(gh<_i24.PriceMobilRepository>()));
    gh.factory<_i36.PriceMotorBaruCubit>(
        () => _i36.PriceMotorBaruCubit(gh<_i25.PriceMotorBaruRepository>()));
    gh.factory<_i37.RegisterCubit>(
        () => _i37.RegisterCubit(gh<_i26.RegisterRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i38.RegisterModule {}
