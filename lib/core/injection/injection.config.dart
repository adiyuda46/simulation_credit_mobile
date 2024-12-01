// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i13;

import '../../data/datasources/local/shared_preferences_datasource.dart'
    as _i12;
import '../../data/datasources/remote/agrement_datasource.dart' as _i3;
import '../../data/datasources/remote/auth_datasource.dart' as _i4;
import '../../data/datasources/remote/cat_mobil_datasource.dart' as _i5;
import '../../data/datasources/remote/cat_motorbaru_datasource.dart' as _i6;
import '../../data/datasources/remote/cat_mp_datasource.dart' as _i7;
import '../../data/datasources/remote/price_mobil_datasource.dart' as _i8;
import '../../data/datasources/remote/price_motorbaru_datasource.dart' as _i9;
import '../../data/datasources/remote/price_mp_datasource.dart' as _i10;
import '../../data/datasources/remote/register_datasource.dart' as _i11;
import '../../data/datasources/remote/simulasi_datasource.dart' as _i14;
import '../../data/datasources/remote/submit_datasource.dart' as _i16;
import '../../data/datasources/remote/var_mobil_datasource.dart' as _i18;
import '../../data/datasources/remote/var_motorbaru_datasource.dart' as _i20;
import '../../data/datasources/remote/var_mp_datasource.dart' as _i22;
import '../../data/repositories/agrment_repository.dart' as _i24;
import '../../data/repositories/auth_repository.dart' as _i25;
import '../../data/repositories/cat_mobil_repository.dart' as _i26;
import '../../data/repositories/cat_motorbaru_repository.dart' as _i27;
import '../../data/repositories/cat_mp_repository.dart' as _i28;
import '../../data/repositories/price_mobil_repository.dart' as _i29;
import '../../data/repositories/price_motorbaru_repository.dart' as _i30;
import '../../data/repositories/price_mp_repository.dart' as _i31;
import '../../data/repositories/register_repository.dart' as _i32;
import '../../data/repositories/simulasi_repository.dart' as _i15;
import '../../data/repositories/submit_repository.dart' as _i17;
import '../../data/repositories/var_mobil_repository.dart' as _i19;
import '../../data/repositories/var_motorbaru_repository.dart' as _i21;
import '../../data/repositories/var_mp_repository.dart' as _i23;
import '../../views/cubits/agrement_cubit.dart' as _i38;
import '../../views/cubits/cat_mobil_cubit.dart' as _i40;
import '../../views/cubits/cat_motorbaru_cubit.dart' as _i41;
import '../../views/cubits/cat_mp_cubit.dart' as _i42;
import '../../views/cubits/login_cubit.dart' as _i39;
import '../../views/cubits/price_mobil_cubit.dart' as _i43;
import '../../views/cubits/price_motorbaru_cubit.dart' as _i44;
import '../../views/cubits/price_mp_cubit.dart' as _i45;
import '../../views/cubits/register_cubit.dart' as _i46;
import '../../views/cubits/simulasi_cubit.dart' as _i33;
import '../../views/cubits/submit_cubit.dart' as _i34;
import '../../views/cubits/var_mobil_cubit.dart' as _i35;
import '../../views/cubits/var_motorbaru_cubit.dart' as _i36;
import '../../views/cubits/var_mp_cubit.dart' as _i37;
import 'register_module.dart' as _i47;

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
    gh.factory<_i7.CatMpDataSource>(() => _i7.CatMpDataSource());
    gh.factory<_i8.PriceMobilDataSource>(() => _i8.PriceMobilDataSource());
    gh.factory<_i9.PriceMotorBaruDataSource>(
        () => _i9.PriceMotorBaruDataSource());
    gh.factory<_i10.PriceMpDataSource>(() => _i10.PriceMpDataSource());
    gh.factory<_i11.RegisterDataSource>(() => _i11.RegisterDataSource());
    gh.singleton<_i12.SessionManager>(() => _i12.SessionManager());
    await gh.lazySingletonAsync<_i13.SharedPreferences>(
      () => registerModule.sharedPreferences,
      preResolve: true,
    );
    gh.factory<_i14.SimulationDataSource>(() => _i14.SimulationDataSource());
    gh.factory<_i15.SimulationRepository>(() => _i15.SimulationRepository(
          gh<_i14.SimulationDataSource>(),
          gh<_i12.SessionManager>(),
        ));
    gh.factory<_i16.SubmitDataSource>(() => _i16.SubmitDataSource());
    gh.factory<_i17.SubmitSimulationRepository>(
        () => _i17.SubmitSimulationRepository(
              gh<_i16.SubmitDataSource>(),
              gh<_i12.SessionManager>(),
            ));
    gh.factory<_i18.VarMobilDataSource>(() => _i18.VarMobilDataSource());
    gh.factory<_i19.VarMobilRepository>(() => _i19.VarMobilRepository(
          gh<_i18.VarMobilDataSource>(),
          gh<_i12.SessionManager>(),
        ));
    gh.factory<_i20.VarMotorBaruDataSource>(
        () => _i20.VarMotorBaruDataSource());
    gh.factory<_i21.VarMotorBaruRepository>(() => _i21.VarMotorBaruRepository(
          gh<_i20.VarMotorBaruDataSource>(),
          gh<_i12.SessionManager>(),
        ));
    gh.factory<_i22.VarMpDataSource>(() => _i22.VarMpDataSource());
    gh.factory<_i23.VarMpRepository>(() => _i23.VarMpRepository(
          gh<_i22.VarMpDataSource>(),
          gh<_i12.SessionManager>(),
        ));
    gh.factory<_i24.AgrementRepository>(() => _i24.AgrementRepository(
          gh<_i3.AgreementDatasource>(),
          gh<_i12.SessionManager>(),
        ));
    gh.factory<_i25.AuthRepository>(() => _i25.AuthRepository(
          gh<_i12.SessionManager>(),
          gh<_i4.AuthenticationDataSource>(),
        ));
    gh.factory<_i26.CatMobilRepository>(() => _i26.CatMobilRepository(
          gh<_i5.CatMobilDatasource>(),
          gh<_i12.SessionManager>(),
        ));
    gh.factory<_i27.CatMotorBaruRepository>(() => _i27.CatMotorBaruRepository(
          gh<_i6.CatMotorbaruDataSource>(),
          gh<_i12.SessionManager>(),
        ));
    gh.factory<_i28.CatMpRepository>(() => _i28.CatMpRepository(
          gh<_i7.CatMpDataSource>(),
          gh<_i12.SessionManager>(),
        ));
    gh.factory<_i29.PriceMobilRepository>(() => _i29.PriceMobilRepository(
          gh<_i8.PriceMobilDataSource>(),
          gh<_i12.SessionManager>(),
        ));
    gh.factory<_i30.PriceMotorBaruRepository>(
        () => _i30.PriceMotorBaruRepository(
              gh<_i9.PriceMotorBaruDataSource>(),
              gh<_i12.SessionManager>(),
            ));
    gh.factory<_i31.PriceMpRepository>(() => _i31.PriceMpRepository(
          gh<_i10.PriceMpDataSource>(),
          gh<_i12.SessionManager>(),
        ));
    gh.factory<_i32.RegisterRepository>(() => _i32.RegisterRepository(
          gh<_i11.RegisterDataSource>(),
          gh<_i12.SessionManager>(),
        ));
    gh.factory<_i33.SimulasiCubit>(
        () => _i33.SimulasiCubit(gh<_i15.SimulationRepository>()));
    gh.factory<_i34.SubmitSimulationCubit>(() =>
        _i34.SubmitSimulationCubit(gh<_i17.SubmitSimulationRepository>()));
    gh.factory<_i35.VarMobilCubit>(
        () => _i35.VarMobilCubit(gh<_i19.VarMobilRepository>()));
    gh.factory<_i36.VarMotorBaruCubit>(
        () => _i36.VarMotorBaruCubit(gh<_i21.VarMotorBaruRepository>()));
    gh.factory<_i37.VarMpCubit>(
        () => _i37.VarMpCubit(gh<_i23.VarMpRepository>()));
    gh.factory<_i38.AgrementCubit>(
        () => _i38.AgrementCubit(gh<_i24.AgrementRepository>()));
    gh.factory<_i39.AuthCubit>(() => _i39.AuthCubit(gh<_i25.AuthRepository>()));
    gh.factory<_i40.CatMobilCubit>(
        () => _i40.CatMobilCubit(gh<_i26.CatMobilRepository>()));
    gh.factory<_i41.CatMotorBaruCubit>(
        () => _i41.CatMotorBaruCubit(gh<_i27.CatMotorBaruRepository>()));
    gh.factory<_i42.CatMpCubit>(
        () => _i42.CatMpCubit(gh<_i28.CatMpRepository>()));
    gh.factory<_i43.PriceMobilCubit>(
        () => _i43.PriceMobilCubit(gh<_i29.PriceMobilRepository>()));
    gh.factory<_i44.PriceMotorBaruCubit>(
        () => _i44.PriceMotorBaruCubit(gh<_i30.PriceMotorBaruRepository>()));
    gh.factory<_i45.PriceMpCubit>(
        () => _i45.PriceMpCubit(gh<_i31.PriceMpRepository>()));
    gh.factory<_i46.RegisterCubit>(
        () => _i46.RegisterCubit(gh<_i32.RegisterRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i47.RegisterModule {}
