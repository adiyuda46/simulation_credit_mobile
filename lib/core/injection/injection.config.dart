// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i7;

import '../../data/datasources/local/shared_preferences_datasource.dart' as _i6;
import '../../data/datasources/remote/auth_datasource.dart' as _i3;
import '../../data/datasources/remote/cat_motorbaru_datasource.dart' as _i4;
import '../../data/datasources/remote/register_datasource.dart' as _i5;
import '../../data/datasources/remote/var_motorbaru_datasource.dart' as _i8;
import '../../data/repositories/auth_repository.dart' as _i10;
import '../../data/repositories/cat_motorbaru_repository.dart' as _i11;
import '../../data/repositories/register_repository.dart' as _i12;
import '../../data/repositories/var_motorbaru_repository.dart' as _i9;
import '../../views/cubits/cat_motorbaru_cubit.dart' as _i15;
import '../../views/cubits/login_cubit.dart' as _i14;
import '../../views/cubits/register_cubit.dart' as _i16;
import '../../views/cubits/var_motorbaru_cubit.dart' as _i13;
import 'register_module.dart' as _i17;

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
    gh.factory<_i5.RegisterDataSource>(() => _i5.RegisterDataSource());
    gh.singleton<_i6.SessionManager>(() => _i6.SessionManager());
    await gh.lazySingletonAsync<_i7.SharedPreferences>(
      () => registerModule.sharedPreferences,
      preResolve: true,
    );
    gh.factory<_i8.VarMotorBaruDataSource>(() => _i8.VarMotorBaruDataSource());
    gh.factory<_i9.VarMotorBaruRepository>(() => _i9.VarMotorBaruRepository(
          gh<_i8.VarMotorBaruDataSource>(),
          gh<_i6.SessionManager>(),
        ));
    gh.factory<_i10.AuthRepository>(() => _i10.AuthRepository(
          gh<_i6.SessionManager>(),
          gh<_i3.AuthenticationDataSource>(),
        ));
    gh.factory<_i11.CatMotorBaruRepository>(() => _i11.CatMotorBaruRepository(
          gh<_i4.CatMotorbaruDataSource>(),
          gh<_i6.SessionManager>(),
        ));
    gh.factory<_i12.RegisterRepository>(() => _i12.RegisterRepository(
          gh<_i5.RegisterDataSource>(),
          gh<_i6.SessionManager>(),
        ));
    gh.factory<_i13.VarMotorBaruCubit>(
        () => _i13.VarMotorBaruCubit(gh<_i9.VarMotorBaruRepository>()));
    gh.factory<_i14.AuthCubit>(() => _i14.AuthCubit(gh<_i10.AuthRepository>()));
    gh.factory<_i15.CatMotorBaruCubit>(
        () => _i15.CatMotorBaruCubit(gh<_i11.CatMotorBaruRepository>()));
    gh.factory<_i16.RegisterCubit>(
        () => _i16.RegisterCubit(gh<_i12.RegisterRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i17.RegisterModule {}
