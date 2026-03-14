// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:guide_me/core/helpers/connectivity_helper.dart' as _i1;
import 'package:guide_me/core/network/api_service.dart' as _i947;
import 'package:guide_me/core/network/dio_service.dart' as _i516;
import 'package:guide_me/core/services/media_picker_service/media_picker_service.dart'
    as _i226;
import 'package:guide_me/core/services/media_picker_service/media_picker_service_impl.dart'
    as _i159;
import 'package:guide_me/core/services/token/token_service.dart' as _i625;
import 'package:guide_me/core/services/token/token_service_impl.dart' as _i574;
import 'package:guide_me/features/auth/data/data_source/Auth_remote_data_source.dart'
    as _i1043;
import 'package:guide_me/features/auth/data/repo/auth_repo_imple.dart' as _i80;
import 'package:guide_me/features/auth/domain/repo/auth_repo.dart' as _i956;
import 'package:guide_me/features/auth/domain/use_case/login_use_case.dart'
    as _i93;
import 'package:guide_me/features/auth/presentation/manager/login_cubit/login_cubit_cubit.dart'
    as _i647;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i1.ConnectivityHelper>(() => _i1.ConnectivityHelper());
    gh.lazySingleton<_i516.DioService>(() => _i516.DioService());
    gh.lazySingleton<_i947.ApiService>(
      () => _i947.ApiService(
        gh<_i516.DioService>(),
        gh<_i1.ConnectivityHelper>(),
      ),
    );
    gh.lazySingleton<_i625.TokenService>(() => _i574.TokenServiceImpl());
    gh.lazySingleton<_i226.MediaPickerService>(
      () => _i159.MediaPickerServiceImpl(),
    );
    gh.factory<_i647.LoginCubit>(
      () => _i647.LoginCubit(gh<_i93.LoginUseCase>()),
    );
    gh.lazySingleton<_i1043.AuthRemoteDataSource>(
      () => _i1043.AuthRemoteDataSourceImpl(gh<_i947.ApiService>()),
    );
    gh.lazySingleton<_i956.AuthRepo>(
      () => _i80.AuthRepoImple(gh<_i1043.AuthRemoteDataSource>()),
    );
    return this;
  }
}
