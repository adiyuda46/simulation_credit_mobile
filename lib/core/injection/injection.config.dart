// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i9;

import '../../data/datasources/local/shared_preferences_datasource.dart' as _i8;
import '../../data/datasources/remote/agrement_datasource.dart' as _i3;
import '../../data/datasources/remote/auth_datasource.dart' as _i4;
import '../../data/datasources/remote/cat_motorbaru_datasource.dart' as _i5;
import '../../data/datasources/remote/price_motorbaru_datasource.dart' as _i6;
import '../../data/datasources/remote/register_datasource.dart' as _i7;
import '../../data/datasources/remote/simulasi_datasource.dart' as _i10;
import '../../data/datasources/remote/submit_datasource.dart' as _i12;
import '../../data/datasources/remote/var_motorbaru_datasource.dart' as _i14;
import '../../data/repositories/agrment_repository.dart' as _i16;
import '../../data/repositories/auth_repository.dart' as _i17;
import '../../data/repositories/cat_motorbaru_repository.dart' as _i18;
import '../../data/repositories/price_motorbaru_repository.dart' as _i19;
import '../../data/repositories/register_repository.dart' as _i20;
import '../../data/repositories/simulasi_repository.dart' as _i11;
import '../../data/repositories/submit_repository.dart' as _i13;
import '../../data/repositories/var_motorbaru_repository.dart' as _i15;
import '../../views/cubits/agrement_cubit.dart' as _i24;
import '../../views/cubits/cat_motorbaru_cubit.dart' as _i26;
import '../../views/cubits/login_cubit.dart' as _i25;
import '../../views/cubits/price_motorbaru_cubit.dart' as _i27;
import '../../views/cubits/register_cubit.dart' as _i28;
import '../../views/cubits/simulasi_cubit.dart' as _i21;
import '../../views/cubits/submit_cubit.dart' as _i22;
import '../../views/cubits/var_motorbaru_cubit.dart' as _i23;
import 'register_module.dart' as _i29;

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
    gh.factory<_i5.CatMotorbaruDataSource>(() => _i5.CatMotorbaruDataSource());
    gh.factory<_i6.PriceMotorBaruDataSource>(
        () => _i6.PriceMotorBaruDataSource());
    gh.factory<_i7.RegisterDataSource>(() => _i7.RegisterDataSource());
    gh.singleton<_i8.SessionManager>(() => _i8.SessionManager());
    await gh.lazySingletonAsync<_i9.SharedPreferences>(
      () => registerModule.sharedPreferences,
      preResolve: true,
    );
    gh.factory<_i10.SimulationDataSource>(() => _i10.SimulationDataSource());
    gh.factory<_i11.SimulationRepository>(() => _i11.SimulationRepository(
          gh<_i10.SimulationDataSource>(),
          gh<_i8.SessionManager>(),
        ));
    gh.factory<_i12.SubmitDataSource>(() => _i12.SubmitDataSource());
    gh.factory<_i13.SubmitSimulationRepository>(
        () => _i13.SubmitSimulationRepository(
              gh<_i12.SubmitDataSource>(),
              gh<_i8.SessionManager>(),
            ));
    gh.factory<_i14.VarMotorBaruDataSource>(
        () => _i14.VarMotorBaruDataSource());
    gh.factory<_i15.VarMotorBaruRepository>(() => _i15.VarMotorBaruRepository(
          gh<_i14.VarMotorBaruDataSource>(),
          gh<_i8.SessionManager>(),
        ));
    gh.factory<_i16.AgrementRepository>(() => _i16.AgrementRepository(
          gh<_i3.AgreementDatasource>(),
          gh<_i8.SessionManager>(),
        ));
    gh.factory<_i17.AuthRepository>(() => _i17.AuthRepository(
          gh<_i8.SessionManager>(),
          gh<_i4.AuthenticationDataSource>(),
        ));
    gh.factory<_i18.CatMotorBaruRepository>(() => _i18.CatMotorBaruRepository(
          gh<_i5.CatMotorbaruDataSource>(),
          gh<_i8.SessionManager>(),
        ));
    gh.factory<_i19.PriceMotorBaruRepository>(
        () => _i19.PriceMotorBaruRepository(
              gh<_i6.PriceMotorBaruDataSource>(),
              gh<_i8.SessionManager>(),
            ));
    gh.factory<_i20.RegisterRepository>(() => _i20.RegisterRepository(
          gh<_i7.RegisterDataSource>(),
          gh<_i8.SessionManager>(),
        ));
    gh.factory<_i21.SimulasiCubit>(
        () => _i21.SimulasiCubit(gh<_i11.SimulationRepository>()));
    gh.factory<_i22.SubmitSimulationCubit>(() =>
        _i22.SubmitSimulationCubit(gh<_i13.SubmitSimulationRepository>()));
    gh.factory<_i23.VarMotorBaruCubit>(
        () => _i23.VarMotorBaruCubit(gh<_i15.VarMotorBaruRepository>()));
    gh.factory<_i24.AgrementCubit>(
        () => _i24.AgrementCubit(gh<_i16.AgrementRepository>()));
    gh.factory<_i25.AuthCubit>(() => _i25.AuthCubit(gh<_i17.AuthRepository>()));
    gh.factory<_i26.CatMotorBaruCubit>(
        () => _i26.CatMotorBaruCubit(gh<_i18.CatMotorBaruRepository>()));
    gh.factory<_i27.PriceMotorBaruCubit>(
        () => _i27.PriceMotorBaruCubit(gh<_i19.PriceMotorBaruRepository>()));
    gh.factory<_i28.RegisterCubit>(
        () => _i28.RegisterCubit(gh<_i20.RegisterRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i29.RegisterModule {}
