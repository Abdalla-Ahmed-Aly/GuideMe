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
import 'package:guide_me/features/auth/domain/use_case/register_use_case.dart'
    as _i885;
import 'package:guide_me/features/auth/domain/use_case/resend_Password_use_case.dart'
    as _i426;
import 'package:guide_me/features/auth/domain/use_case/reset_Password_use_case.dart'
    as _i865;
import 'package:guide_me/features/auth/domain/use_case/send_Forget_Password_use_case.dart'
    as _i814;
import 'package:guide_me/features/auth/domain/use_case/verify_Forget_Password_use_case.dart'
    as _i393;
import 'package:guide_me/features/auth/presentation/manager/login_cubit/login_cubit.dart'
    as _i940;
import 'package:guide_me/features/auth/presentation/manager/register_cubit/register_cubit.dart'
    as _i772;
import 'package:guide_me/features/auth/presentation/manager/resend_forget_password_cubit/resend_forget_password_cubit.dart'
    as _i968;
import 'package:guide_me/features/auth/presentation/manager/reset_password_cubit/reset_password_cubit.dart'
    as _i593;
import 'package:guide_me/features/auth/presentation/manager/send_forget_password/send_forget_password_cubit.dart'
    as _i776;
import 'package:guide_me/features/auth/presentation/manager/verify_password_cubit/verify_password_cubit.dart'
    as _i577;
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
    gh.lazySingleton<_i1043.AuthRemoteDataSource>(
      () => _i1043.AuthRemoteDataSourceImpl(gh<_i947.ApiService>()),
    );
    gh.lazySingleton<_i956.AuthRepo>(
      () => _i80.AuthRepoImple(gh<_i1043.AuthRemoteDataSource>()),
    );
    gh.factory<_i426.ResendPasswordUseCase>(
      () => _i426.ResendPasswordUseCase(gh<_i956.AuthRepo>()),
    );
    gh.factory<_i865.ResetPasswordUseCase>(
      () => _i865.ResetPasswordUseCase(gh<_i956.AuthRepo>()),
    );
    gh.factory<_i814.SendForgetPasswordUseCase>(
      () => _i814.SendForgetPasswordUseCase(gh<_i956.AuthRepo>()),
    );
    gh.factory<_i593.ResetPasswordCubit>(
      () => _i593.ResetPasswordCubit(gh<_i865.ResetPasswordUseCase>()),
    );
    gh.lazySingleton<_i885.RegisterUseCase>(
      () => _i885.RegisterUseCase(gh<_i956.AuthRepo>()),
    );
    gh.factory<_i93.LoginUseCase>(
      () => _i93.LoginUseCase(gh<_i956.AuthRepo>()),
    );
    gh.factory<_i393.VerifyForgetPasswordUseCase>(
      () => _i393.VerifyForgetPasswordUseCase(gh<_i956.AuthRepo>()),
    );
    gh.factory<_i577.VerifyPasswordCubit>(
      () => _i577.VerifyPasswordCubit(gh<_i393.VerifyForgetPasswordUseCase>()),
    );
    gh.factory<_i772.RegisterCubit>(
      () => _i772.RegisterCubit(gh<_i885.RegisterUseCase>()),
    );
    gh.factory<_i776.SendForgetPasswordCubit>(
      () =>
          _i776.SendForgetPasswordCubit(gh<_i814.SendForgetPasswordUseCase>()),
    );
    gh.factory<_i968.ResendForgetPasswordCubit>(
      () => _i968.ResendForgetPasswordCubit(gh<_i426.ResendPasswordUseCase>()),
    );
    gh.factory<_i940.LoginCubit>(
      () => _i940.LoginCubit(gh<_i93.LoginUseCase>()),
    );
    return this;
  }
}
