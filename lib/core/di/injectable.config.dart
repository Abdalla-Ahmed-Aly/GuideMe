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
import 'package:guide_me/features/home/data/repo_impl/home_repo_impl.dart'
    as _i955;
import 'package:guide_me/features/home/data/sources/home_sources.dart' as _i692;
import 'package:guide_me/features/home/domain/repo/home_repo.dart' as _i1045;
import 'package:guide_me/features/home/domain/usecases/place_by_category_usecase.dart'
    as _i205;
import 'package:guide_me/features/home/domain/usecases/place_by_city_usecase.dart'
    as _i985;
import 'package:guide_me/features/home/presentation/cubits/get_home_data/get_home_cubit.dart'
    as _i792;
import 'package:guide_me/features/home/presentation/cubits/get_place_by_category/place_by_category_cubit.dart'
    as _i554;
import 'package:guide_me/features/home/presentation/cubits/get_place_by_city/place_by_city_cubit.dart'
    as _i137;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i205.PlaceByCategoryUsecase>(
      () => _i205.PlaceByCategoryUsecase(),
    );
    gh.factory<_i985.PlaceByCityUsecase>(() => _i985.PlaceByCityUsecase());
    gh.lazySingleton<_i1.ConnectivityHelper>(() => _i1.ConnectivityHelper());
    gh.lazySingleton<_i516.DioService>(() => _i516.DioService());
    gh.lazySingleton<_i1045.HomeRepo>(() => _i955.HomeRepoImpl());
    gh.lazySingleton<_i947.ApiService>(
      () => _i947.ApiService(
        gh<_i516.DioService>(),
        gh<_i1.ConnectivityHelper>(),
      ),
    );
    gh.lazySingleton<_i625.TokenService>(() => _i574.TokenServiceImpl());
    gh.lazySingleton<_i692.HomeService>(() => _i692.HomeApiServiceImpl());
    gh.lazySingleton<_i226.MediaPickerService>(
      () => _i159.MediaPickerServiceImpl(),
    );
    gh.factory<_i137.PlaceByCityCubit>(
      () => _i137.PlaceByCityCubit(gh<_i985.PlaceByCityUsecase>()),
    );
    gh.factory<_i554.PlaceByCategoryCubit>(
      () => _i554.PlaceByCategoryCubit(gh<_i205.PlaceByCategoryUsecase>()),
    );
    gh.factory<_i792.GetHomeCubit>(
      () => _i792.GetHomeCubit(gh<_i1045.HomeRepo>()),
    );
    return this;
  }
}
