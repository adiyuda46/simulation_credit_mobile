// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i16;

import '../../data/datasources/local/shared_preferences_datasource.dart'
    as _i15;
import '../../data/datasources/remote/accountDetail_datasource.dart' as _i3;
import '../../data/datasources/remote/agrement_datasource.dart' as _i4;
import '../../data/datasources/remote/auth_datasource.dart' as _i5;
import '../../data/datasources/remote/cat_mobil_datasource.dart' as _i6;
import '../../data/datasources/remote/cat_motorbaru_datasource.dart' as _i7;
import '../../data/datasources/remote/cat_motorBekas_datasource.dart' as _i8;
import '../../data/datasources/remote/cat_mp_datasource.dart' as _i9;
import '../../data/datasources/remote/price_mobil_datasource.dart' as _i10;
import '../../data/datasources/remote/price_motorbaru_datasource.dart' as _i11;
import '../../data/datasources/remote/price_motorBekas_datasource.dart' as _i12;
import '../../data/datasources/remote/price_mp_datasource.dart' as _i13;
import '../../data/datasources/remote/register_datasource.dart' as _i14;
import '../../data/datasources/remote/simulasi_datasource.dart' as _i17;
import '../../data/datasources/remote/submit_datasource.dart' as _i19;
import '../../data/datasources/remote/var_mobil_datasource.dart' as _i21;
import '../../data/datasources/remote/var_motorbaru_datasource.dart' as _i23;
import '../../data/datasources/remote/var_motorBekas_datasource.dart' as _i25;
import '../../data/datasources/remote/var_mp_datasource.dart' as _i27;
import '../../data/repositories/accountDetail_repository.dart' as _i29;
import '../../data/repositories/agrment_repository.dart' as _i30;
import '../../data/repositories/auth_repository.dart' as _i31;
import '../../data/repositories/cat_mobil_repository.dart' as _i32;
import '../../data/repositories/cat_motorbaru_repository.dart' as _i33;
import '../../data/repositories/cat_motorBekas_repository.dart' as _i34;
import '../../data/repositories/cat_mp_repository.dart' as _i35;
import '../../data/repositories/price_mobil_repository.dart' as _i36;
import '../../data/repositories/price_motorbaru_repository.dart' as _i37;
import '../../data/repositories/price_motorBekas_repository.dart' as _i38;
import '../../data/repositories/price_mp_repository.dart' as _i39;
import '../../data/repositories/register_repository.dart' as _i40;
import '../../data/repositories/simulasi_repository.dart' as _i18;
import '../../data/repositories/submit_repository.dart' as _i20;
import '../../data/repositories/var_mobil_repository.dart' as _i22;
import '../../data/repositories/var_motorbaru_repository.dart' as _i24;
import '../../data/repositories/var_motorBekas_repository.dart' as _i26;
import '../../data/repositories/var_mp_repository.dart' as _i28;
import '../../views/cubits/accountDetails_cubit.dart' as _i47;
import '../../views/cubits/agrement_cubit.dart' as _i48;
import '../../views/cubits/cat_mobil_cubit.dart' as _i50;
import '../../views/cubits/cat_morotBekas_cubit.dart' as _i52;
import '../../views/cubits/cat_motorbaru_cubit.dart' as _i51;
import '../../views/cubits/cat_mp_cubit.dart' as _i53;
import '../../views/cubits/login_cubit.dart' as _i49;
import '../../views/cubits/price_mobil_cubit.dart' as _i54;
import '../../views/cubits/price_motorbaru_cubit.dart' as _i55;
import '../../views/cubits/price_motorBekas_cubit.dart' as _i56;
import '../../views/cubits/price_mp_cubit.dart' as _i57;
import '../../views/cubits/register_cubit.dart' as _i58;
import '../../views/cubits/simulasi_cubit.dart' as _i41;
import '../../views/cubits/submit_cubit.dart' as _i42;
import '../../views/cubits/var_mobil_cubit.dart' as _i43;
import '../../views/cubits/var_motorbaru_cubit.dart' as _i44;
import '../../views/cubits/var_motorBekas_cubit.dart' as _i45;
import '../../views/cubits/var_mp_cubit.dart' as _i46;
import 'register_module.dart' as _i59;

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
    gh.factory<_i3.AccountDetailsDatasource>(
        () => _i3.AccountDetailsDatasource());
    gh.factory<_i4.AgreementDatasource>(() => _i4.AgreementDatasource());
    gh.factory<_i5.AuthenticationDataSource>(
        () => _i5.AuthenticationDataSource());
    gh.factory<_i6.CatMobilDatasource>(() => _i6.CatMobilDatasource());
    gh.factory<_i7.CatMotorbaruDataSource>(() => _i7.CatMotorbaruDataSource());
    gh.factory<_i8.CatMotorbekasDataSource>(
        () => _i8.CatMotorbekasDataSource());
    gh.factory<_i9.CatMpDataSource>(() => _i9.CatMpDataSource());
    gh.factory<_i10.PriceMobilDataSource>(() => _i10.PriceMobilDataSource());
    gh.factory<_i11.PriceMotorBaruDataSource>(
        () => _i11.PriceMotorBaruDataSource());
    gh.factory<_i12.PriceMotorBekasDataSource>(
        () => _i12.PriceMotorBekasDataSource());
    gh.factory<_i13.PriceMpDataSource>(() => _i13.PriceMpDataSource());
    gh.factory<_i14.RegisterDataSource>(() => _i14.RegisterDataSource());
    gh.singleton<_i15.SessionManager>(() => _i15.SessionManager());
    await gh.lazySingletonAsync<_i16.SharedPreferences>(
      () => registerModule.sharedPreferences,
      preResolve: true,
    );
    gh.factory<_i17.SimulationDataSource>(() => _i17.SimulationDataSource());
    gh.factory<_i18.SimulationRepository>(() => _i18.SimulationRepository(
          gh<_i17.SimulationDataSource>(),
          gh<_i15.SessionManager>(),
        ));
    gh.factory<_i19.SubmitDataSource>(() => _i19.SubmitDataSource());
    gh.factory<_i20.SubmitSimulationRepository>(
        () => _i20.SubmitSimulationRepository(
              gh<_i19.SubmitDataSource>(),
              gh<_i15.SessionManager>(),
            ));
    gh.factory<_i21.VarMobilDataSource>(() => _i21.VarMobilDataSource());
    gh.factory<_i22.VarMobilRepository>(() => _i22.VarMobilRepository(
          gh<_i21.VarMobilDataSource>(),
          gh<_i15.SessionManager>(),
        ));
    gh.factory<_i23.VarMotorBaruDataSource>(
        () => _i23.VarMotorBaruDataSource());
    gh.factory<_i24.VarMotorBaruRepository>(() => _i24.VarMotorBaruRepository(
          gh<_i23.VarMotorBaruDataSource>(),
          gh<_i15.SessionManager>(),
        ));
    gh.factory<_i25.VarMotorBekasDataSource>(
        () => _i25.VarMotorBekasDataSource());
    gh.factory<_i26.VarMotorBekasRepository>(() => _i26.VarMotorBekasRepository(
          gh<_i25.VarMotorBekasDataSource>(),
          gh<_i15.SessionManager>(),
        ));
    gh.factory<_i27.VarMpDataSource>(() => _i27.VarMpDataSource());
    gh.factory<_i28.VarMpRepository>(() => _i28.VarMpRepository(
          gh<_i27.VarMpDataSource>(),
          gh<_i15.SessionManager>(),
        ));
    gh.factory<_i29.AccountDetailRepository>(() => _i29.AccountDetailRepository(
          gh<_i3.AccountDetailsDatasource>(),
          gh<_i15.SessionManager>(),
        ));
    gh.factory<_i30.AgrementRepository>(() => _i30.AgrementRepository(
          gh<_i4.AgreementDatasource>(),
          gh<_i15.SessionManager>(),
        ));
    gh.factory<_i31.AuthRepository>(() => _i31.AuthRepository(
          gh<_i15.SessionManager>(),
          gh<_i5.AuthenticationDataSource>(),
        ));
    gh.factory<_i32.CatMobilRepository>(() => _i32.CatMobilRepository(
          gh<_i6.CatMobilDatasource>(),
          gh<_i15.SessionManager>(),
        ));
    gh.factory<_i33.CatMotorBaruRepository>(() => _i33.CatMotorBaruRepository(
          gh<_i7.CatMotorbaruDataSource>(),
          gh<_i15.SessionManager>(),
        ));
    gh.factory<_i34.CatMotorBekasRepository>(() => _i34.CatMotorBekasRepository(
          gh<_i8.CatMotorbekasDataSource>(),
          gh<_i15.SessionManager>(),
        ));
    gh.factory<_i35.CatMpRepository>(() => _i35.CatMpRepository(
          gh<_i9.CatMpDataSource>(),
          gh<_i15.SessionManager>(),
        ));
    gh.factory<_i36.PriceMobilRepository>(() => _i36.PriceMobilRepository(
          gh<_i10.PriceMobilDataSource>(),
          gh<_i15.SessionManager>(),
        ));
    gh.factory<_i37.PriceMotorBaruRepository>(
        () => _i37.PriceMotorBaruRepository(
              gh<_i11.PriceMotorBaruDataSource>(),
              gh<_i15.SessionManager>(),
            ));
    gh.factory<_i38.PriceMotorBekasRepository>(
        () => _i38.PriceMotorBekasRepository(
              gh<_i12.PriceMotorBekasDataSource>(),
              gh<_i15.SessionManager>(),
            ));
    gh.factory<_i39.PriceMpRepository>(() => _i39.PriceMpRepository(
          gh<_i13.PriceMpDataSource>(),
          gh<_i15.SessionManager>(),
        ));
    gh.factory<_i40.RegisterRepository>(() => _i40.RegisterRepository(
          gh<_i14.RegisterDataSource>(),
          gh<_i15.SessionManager>(),
        ));
    gh.factory<_i41.SimulasiCubit>(
        () => _i41.SimulasiCubit(gh<_i18.SimulationRepository>()));
    gh.factory<_i42.SubmitSimulationCubit>(() =>
        _i42.SubmitSimulationCubit(gh<_i20.SubmitSimulationRepository>()));
    gh.factory<_i43.VarMobilCubit>(
        () => _i43.VarMobilCubit(gh<_i22.VarMobilRepository>()));
    gh.factory<_i44.VarMotorBaruCubit>(
        () => _i44.VarMotorBaruCubit(gh<_i24.VarMotorBaruRepository>()));
    gh.factory<_i45.VarMotorBekasCubit>(
        () => _i45.VarMotorBekasCubit(gh<_i26.VarMotorBekasRepository>()));
    gh.factory<_i46.VarMpCubit>(
        () => _i46.VarMpCubit(gh<_i28.VarMpRepository>()));
    gh.factory<_i47.AccountDetailCubit>(
        () => _i47.AccountDetailCubit(gh<_i29.AccountDetailRepository>()));
    gh.factory<_i48.AgrementCubit>(
        () => _i48.AgrementCubit(gh<_i30.AgrementRepository>()));
    gh.factory<_i49.AuthCubit>(() => _i49.AuthCubit(gh<_i31.AuthRepository>()));
    gh.factory<_i50.CatMobilCubit>(
        () => _i50.CatMobilCubit(gh<_i32.CatMobilRepository>()));
    gh.factory<_i51.CatMotorBaruCubit>(
        () => _i51.CatMotorBaruCubit(gh<_i33.CatMotorBaruRepository>()));
    gh.factory<_i52.CatMotorBekasCubit>(
        () => _i52.CatMotorBekasCubit(gh<_i34.CatMotorBekasRepository>()));
    gh.factory<_i53.CatMpCubit>(
        () => _i53.CatMpCubit(gh<_i35.CatMpRepository>()));
    gh.factory<_i54.PriceMobilCubit>(
        () => _i54.PriceMobilCubit(gh<_i36.PriceMobilRepository>()));
    gh.factory<_i55.PriceMotorBaruCubit>(
        () => _i55.PriceMotorBaruCubit(gh<_i37.PriceMotorBaruRepository>()));
    gh.factory<_i56.PriceMotorBekasCubit>(
        () => _i56.PriceMotorBekasCubit(gh<_i38.PriceMotorBekasRepository>()));
    gh.factory<_i57.PriceMpCubit>(
        () => _i57.PriceMpCubit(gh<_i39.PriceMpRepository>()));
    gh.factory<_i58.RegisterCubit>(
        () => _i58.RegisterCubit(gh<_i40.RegisterRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i59.RegisterModule {}
