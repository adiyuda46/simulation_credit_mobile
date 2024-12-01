// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i15;

import '../../data/datasources/local/shared_preferences_datasource.dart'
    as _i14;
import '../../data/datasources/remote/agrement_datasource.dart' as _i3;
import '../../data/datasources/remote/auth_datasource.dart' as _i4;
import '../../data/datasources/remote/cat_mobil_datasource.dart' as _i5;
import '../../data/datasources/remote/cat_motorbaru_datasource.dart' as _i6;
import '../../data/datasources/remote/cat_motorBekas_datasource.dart' as _i7;
import '../../data/datasources/remote/cat_mp_datasource.dart' as _i8;
import '../../data/datasources/remote/price_mobil_datasource.dart' as _i9;
import '../../data/datasources/remote/price_motorbaru_datasource.dart' as _i10;
import '../../data/datasources/remote/price_motorBekas_datasource.dart' as _i11;
import '../../data/datasources/remote/price_mp_datasource.dart' as _i12;
import '../../data/datasources/remote/register_datasource.dart' as _i13;
import '../../data/datasources/remote/simulasi_datasource.dart' as _i16;
import '../../data/datasources/remote/submit_datasource.dart' as _i18;
import '../../data/datasources/remote/var_mobil_datasource.dart' as _i20;
import '../../data/datasources/remote/var_motorbaru_datasource.dart' as _i22;
import '../../data/datasources/remote/var_motorBekas_datasource.dart' as _i24;
import '../../data/datasources/remote/var_mp_datasource.dart' as _i26;
import '../../data/repositories/agrment_repository.dart' as _i28;
import '../../data/repositories/auth_repository.dart' as _i29;
import '../../data/repositories/cat_mobil_repository.dart' as _i30;
import '../../data/repositories/cat_motorbaru_repository.dart' as _i31;
import '../../data/repositories/cat_motorBekas_repository.dart' as _i32;
import '../../data/repositories/cat_mp_repository.dart' as _i33;
import '../../data/repositories/price_mobil_repository.dart' as _i34;
import '../../data/repositories/price_motorbaru_repository.dart' as _i35;
import '../../data/repositories/price_motorBekas_repository.dart' as _i36;
import '../../data/repositories/price_mp_repository.dart' as _i37;
import '../../data/repositories/register_repository.dart' as _i38;
import '../../data/repositories/simulasi_repository.dart' as _i17;
import '../../data/repositories/submit_repository.dart' as _i19;
import '../../data/repositories/var_mobil_repository.dart' as _i21;
import '../../data/repositories/var_motorbaru_repository.dart' as _i23;
import '../../data/repositories/var_motorBekas_repository.dart' as _i25;
import '../../data/repositories/var_mp_repository.dart' as _i27;
import '../../views/cubits/agrement_cubit.dart' as _i45;
import '../../views/cubits/cat_mobil_cubit.dart' as _i47;
import '../../views/cubits/cat_morotBekas_cubit.dart' as _i49;
import '../../views/cubits/cat_motorbaru_cubit.dart' as _i48;
import '../../views/cubits/cat_mp_cubit.dart' as _i50;
import '../../views/cubits/login_cubit.dart' as _i46;
import '../../views/cubits/price_mobil_cubit.dart' as _i51;
import '../../views/cubits/price_motorbaru_cubit.dart' as _i52;
import '../../views/cubits/price_motorBekas_cubit.dart' as _i53;
import '../../views/cubits/price_mp_cubit.dart' as _i54;
import '../../views/cubits/register_cubit.dart' as _i55;
import '../../views/cubits/simulasi_cubit.dart' as _i39;
import '../../views/cubits/submit_cubit.dart' as _i40;
import '../../views/cubits/var_mobil_cubit.dart' as _i41;
import '../../views/cubits/var_motorbaru_cubit.dart' as _i42;
import '../../views/cubits/var_motorBekas_cubit.dart' as _i43;
import '../../views/cubits/var_mp_cubit.dart' as _i44;
import 'register_module.dart' as _i56;

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
    gh.factory<_i7.CatMotorbekasDataSource>(
        () => _i7.CatMotorbekasDataSource());
    gh.factory<_i8.CatMpDataSource>(() => _i8.CatMpDataSource());
    gh.factory<_i9.PriceMobilDataSource>(() => _i9.PriceMobilDataSource());
    gh.factory<_i10.PriceMotorBaruDataSource>(
        () => _i10.PriceMotorBaruDataSource());
    gh.factory<_i11.PriceMotorBekasDataSource>(
        () => _i11.PriceMotorBekasDataSource());
    gh.factory<_i12.PriceMpDataSource>(() => _i12.PriceMpDataSource());
    gh.factory<_i13.RegisterDataSource>(() => _i13.RegisterDataSource());
    gh.singleton<_i14.SessionManager>(() => _i14.SessionManager());
    await gh.lazySingletonAsync<_i15.SharedPreferences>(
      () => registerModule.sharedPreferences,
      preResolve: true,
    );
    gh.factory<_i16.SimulationDataSource>(() => _i16.SimulationDataSource());
    gh.factory<_i17.SimulationRepository>(() => _i17.SimulationRepository(
          gh<_i16.SimulationDataSource>(),
          gh<_i14.SessionManager>(),
        ));
    gh.factory<_i18.SubmitDataSource>(() => _i18.SubmitDataSource());
    gh.factory<_i19.SubmitSimulationRepository>(
        () => _i19.SubmitSimulationRepository(
              gh<_i18.SubmitDataSource>(),
              gh<_i14.SessionManager>(),
            ));
    gh.factory<_i20.VarMobilDataSource>(() => _i20.VarMobilDataSource());
    gh.factory<_i21.VarMobilRepository>(() => _i21.VarMobilRepository(
          gh<_i20.VarMobilDataSource>(),
          gh<_i14.SessionManager>(),
        ));
    gh.factory<_i22.VarMotorBaruDataSource>(
        () => _i22.VarMotorBaruDataSource());
    gh.factory<_i23.VarMotorBaruRepository>(() => _i23.VarMotorBaruRepository(
          gh<_i22.VarMotorBaruDataSource>(),
          gh<_i14.SessionManager>(),
        ));
    gh.factory<_i24.VarMotorBekasDataSource>(
        () => _i24.VarMotorBekasDataSource());
    gh.factory<_i25.VarMotorBekasRepository>(() => _i25.VarMotorBekasRepository(
          gh<_i24.VarMotorBekasDataSource>(),
          gh<_i14.SessionManager>(),
        ));
    gh.factory<_i26.VarMpDataSource>(() => _i26.VarMpDataSource());
    gh.factory<_i27.VarMpRepository>(() => _i27.VarMpRepository(
          gh<_i26.VarMpDataSource>(),
          gh<_i14.SessionManager>(),
        ));
    gh.factory<_i28.AgrementRepository>(() => _i28.AgrementRepository(
          gh<_i3.AgreementDatasource>(),
          gh<_i14.SessionManager>(),
        ));
    gh.factory<_i29.AuthRepository>(() => _i29.AuthRepository(
          gh<_i14.SessionManager>(),
          gh<_i4.AuthenticationDataSource>(),
        ));
    gh.factory<_i30.CatMobilRepository>(() => _i30.CatMobilRepository(
          gh<_i5.CatMobilDatasource>(),
          gh<_i14.SessionManager>(),
        ));
    gh.factory<_i31.CatMotorBaruRepository>(() => _i31.CatMotorBaruRepository(
          gh<_i6.CatMotorbaruDataSource>(),
          gh<_i14.SessionManager>(),
        ));
    gh.factory<_i32.CatMotorBekasRepository>(() => _i32.CatMotorBekasRepository(
          gh<_i7.CatMotorbekasDataSource>(),
          gh<_i14.SessionManager>(),
        ));
    gh.factory<_i33.CatMpRepository>(() => _i33.CatMpRepository(
          gh<_i8.CatMpDataSource>(),
          gh<_i14.SessionManager>(),
        ));
    gh.factory<_i34.PriceMobilRepository>(() => _i34.PriceMobilRepository(
          gh<_i9.PriceMobilDataSource>(),
          gh<_i14.SessionManager>(),
        ));
    gh.factory<_i35.PriceMotorBaruRepository>(
        () => _i35.PriceMotorBaruRepository(
              gh<_i10.PriceMotorBaruDataSource>(),
              gh<_i14.SessionManager>(),
            ));
    gh.factory<_i36.PriceMotorBekasRepository>(
        () => _i36.PriceMotorBekasRepository(
              gh<_i11.PriceMotorBekasDataSource>(),
              gh<_i14.SessionManager>(),
            ));
    gh.factory<_i37.PriceMpRepository>(() => _i37.PriceMpRepository(
          gh<_i12.PriceMpDataSource>(),
          gh<_i14.SessionManager>(),
        ));
    gh.factory<_i38.RegisterRepository>(() => _i38.RegisterRepository(
          gh<_i13.RegisterDataSource>(),
          gh<_i14.SessionManager>(),
        ));
    gh.factory<_i39.SimulasiCubit>(
        () => _i39.SimulasiCubit(gh<_i17.SimulationRepository>()));
    gh.factory<_i40.SubmitSimulationCubit>(() =>
        _i40.SubmitSimulationCubit(gh<_i19.SubmitSimulationRepository>()));
    gh.factory<_i41.VarMobilCubit>(
        () => _i41.VarMobilCubit(gh<_i21.VarMobilRepository>()));
    gh.factory<_i42.VarMotorBaruCubit>(
        () => _i42.VarMotorBaruCubit(gh<_i23.VarMotorBaruRepository>()));
    gh.factory<_i43.VarMotorBekasCubit>(
        () => _i43.VarMotorBekasCubit(gh<_i25.VarMotorBekasRepository>()));
    gh.factory<_i44.VarMpCubit>(
        () => _i44.VarMpCubit(gh<_i27.VarMpRepository>()));
    gh.factory<_i45.AgrementCubit>(
        () => _i45.AgrementCubit(gh<_i28.AgrementRepository>()));
    gh.factory<_i46.AuthCubit>(() => _i46.AuthCubit(gh<_i29.AuthRepository>()));
    gh.factory<_i47.CatMobilCubit>(
        () => _i47.CatMobilCubit(gh<_i30.CatMobilRepository>()));
    gh.factory<_i48.CatMotorBaruCubit>(
        () => _i48.CatMotorBaruCubit(gh<_i31.CatMotorBaruRepository>()));
    gh.factory<_i49.CatMotorBekasCubit>(
        () => _i49.CatMotorBekasCubit(gh<_i32.CatMotorBekasRepository>()));
    gh.factory<_i50.CatMpCubit>(
        () => _i50.CatMpCubit(gh<_i33.CatMpRepository>()));
    gh.factory<_i51.PriceMobilCubit>(
        () => _i51.PriceMobilCubit(gh<_i34.PriceMobilRepository>()));
    gh.factory<_i52.PriceMotorBaruCubit>(
        () => _i52.PriceMotorBaruCubit(gh<_i35.PriceMotorBaruRepository>()));
    gh.factory<_i53.PriceMotorBekasCubit>(
        () => _i53.PriceMotorBekasCubit(gh<_i36.PriceMotorBekasRepository>()));
    gh.factory<_i54.PriceMpCubit>(
        () => _i54.PriceMpCubit(gh<_i37.PriceMpRepository>()));
    gh.factory<_i55.RegisterCubit>(
        () => _i55.RegisterCubit(gh<_i38.RegisterRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i56.RegisterModule {}
