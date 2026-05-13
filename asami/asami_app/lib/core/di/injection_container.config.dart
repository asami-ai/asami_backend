// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:common_utils2/common_utils2.dart' as _i958;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/data/datasources/auth_remote_datasource.dart'
    as _i161;
import '../../features/auth/data/repositories_impl/auth_repository_impl.dart'
    as _i710;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i787;
import '../../features/auth/domain/usecases/login_usecase.dart' as _i188;
import '../../features/auth/domain/usecases/logout_usecase.dart' as _i48;
import '../../features/auth/domain/usecases/signup_usecase.dart' as _i57;
import '../../features/auth/presentation/cubit/auth_cubit.dart' as _i117;
import '../router/app_router.dart' as _i81;
import 'utility_modules.dart' as _i150;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final utilityModules = _$UtilityModules();
    gh.lazySingleton<_i958.LoggerService>(() => utilityModules.loggerService);
    gh.lazySingleton<_i958.StorageService>(() => utilityModules.storageService);
    gh.lazySingleton<_i958.DeviceInfoHelper>(
        () => utilityModules.deviceInfoHelper);
    gh.lazySingleton<_i958.NetworkConnectivity>(
        () => utilityModules.networkConnectivity);
    gh.lazySingleton<_i81.AppRouter>(() => _i81.AppRouter());
    gh.lazySingleton<_i161.AuthRemoteDatasource>(
        () => _i161.AuthRemoteDatasourceImpl());
    gh.lazySingleton<_i787.AuthRepository>(() => _i710.AuthRepositoryImpl(
        authRemoteDatasource: gh<_i161.AuthRemoteDatasource>()));
    gh.lazySingleton<_i188.LoginUseCase>(
        () => _i188.LoginUseCase(authRepository: gh<_i787.AuthRepository>()));
    gh.lazySingleton<_i48.LogoutUseCase>(
        () => _i48.LogoutUseCase(authRepository: gh<_i787.AuthRepository>()));
    gh.lazySingleton<_i57.SignUpUseCase>(
        () => _i57.SignUpUseCase(authRepository: gh<_i787.AuthRepository>()));
    gh.lazySingleton<_i117.AuthCubit>(() => _i117.AuthCubit(
          signUpUseCase: gh<_i57.SignUpUseCase>(),
          loginUseCase: gh<_i188.LoginUseCase>(),
          logoutUseCase: gh<_i48.LogoutUseCase>(),
        ));
    return this;
  }
}

class _$UtilityModules extends _i150.UtilityModules {}
