// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i8;

import '../../data/datasources/local/shared_preferences_datasource.dart' as _i7;
import '../../data/datasources/remote/auth_datasource.dart' as _i3;
import '../../data/datasources/remote/cat_motorbaru_datasource.dart' as _i4;
import '../../data/datasources/remote/price_motorbaru_datasource.dart' as _i5;
import '../../data/datasources/remote/register_datasource.dart' as _i6;
import '../../data/datasources/remote/simulasi_datasource.dart' as _i9;
import '../../data/datasources/remote/var_motorbaru_datasource.dart' as _i11;
import '../../data/repositories/auth_repository.dart' as _i13;
import '../../data/repositories/cat_motorbaru_repository.dart' as _i14;
import '../../data/repositories/price_motorbaru_repository.dart' as _i15;
import '../../data/repositories/register_repository.dart' as _i16;
import '../../data/repositories/simulasi_repository.dart' as _i10;
import '../../data/repositories/var_motorbaru_repository.dart' as _i12;
import '../../views/cubits/cat_motorbaru_cubit.dart' as _i20;
import '../../views/cubits/login_cubit.dart' as _i19;
import '../../views/cubits/price_motorbaru_cubit.dart' as _i21;
import '../../views/cubits/register_cubit.dart' as _i22;
import '../../views/cubits/simulasi_cubit.dart' as _i17;
import '../../views/cubits/var_motorbaru_cubit.dart' as _i18;
import 'register_module.dart' as _i23;

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
    gh.factory<_i3.AuthenticationDataSource>(
        () => _i3.AuthenticationDataSource());
    gh.factory<_i4.CatMotorbaruDataSource>(() => _i4.CatMotorbaruDataSource());
    gh.factory<_i5.PriceMotorBaruDataSource>(
        () => _i5.PriceMotorBaruDataSource());
    gh.factory<_i6.RegisterDataSource>(() => _i6.RegisterDataSource());
    gh.singleton<_i7.SessionManager>(() => _i7.SessionManager());
    await gh.lazySingletonAsync<_i8.SharedPreferences>(
      () => registerModule.sharedPreferences,
      preResolve: true,
    );
    gh.factory<_i9.SimulationDataSource>(() => _i9.SimulationDataSource());
    gh.factory<_i10.SimulationRepository>(() => _i10.SimulationRepository(
          gh<_i9.SimulationDataSource>(),
          gh<_i7.SessionManager>(),
        ));
    gh.factory<_i11.VarMotorBaruDataSource>(
        () => _i11.VarMotorBaruDataSource());
    gh.factory<_i12.VarMotorBaruRepository>(() => _i12.VarMotorBaruRepository(
          gh<_i11.VarMotorBaruDataSource>(),
          gh<_i7.SessionManager>(),
        ));
    gh.factory<_i13.AuthRepository>(() => _i13.AuthRepository(
          gh<_i7.SessionManager>(),
          gh<_i3.AuthenticationDataSource>(),
        ));
    gh.factory<_i14.CatMotorBaruRepository>(() => _i14.CatMotorBaruRepository(
          gh<_i4.CatMotorbaruDataSource>(),
          gh<_i7.SessionManager>(),
        ));
    gh.factory<_i15.PriceMotorBaruRepository>(
        () => _i15.PriceMotorBaruRepository(
              gh<_i5.PriceMotorBaruDataSource>(),
              gh<_i7.SessionManager>(),
            ));
    gh.factory<_i16.RegisterRepository>(() => _i16.RegisterRepository(
          gh<_i6.RegisterDataSource>(),
          gh<_i7.SessionManager>(),
        ));
    gh.factory<_i17.SimulasiCubit>(
        () => _i17.SimulasiCubit(gh<_i10.SimulationRepository>()));
    gh.factory<_i18.VarMotorBaruCubit>(
        () => _i18.VarMotorBaruCubit(gh<_i12.VarMotorBaruRepository>()));
    gh.factory<_i19.AuthCubit>(() => _i19.AuthCubit(gh<_i13.AuthRepository>()));
    gh.factory<_i20.CatMotorBaruCubit>(
        () => _i20.CatMotorBaruCubit(gh<_i14.CatMotorBaruRepository>()));
    gh.factory<_i21.PriceMotorBaruCubit>(
        () => _i21.PriceMotorBaruCubit(gh<_i15.PriceMotorBaruRepository>()));
    gh.factory<_i22.RegisterCubit>(
        () => _i22.RegisterCubit(gh<_i16.RegisterRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i23.RegisterModule {}
