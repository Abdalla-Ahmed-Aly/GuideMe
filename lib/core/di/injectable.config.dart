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
import 'package:guide_me/features/booking/data/data_sources/remote/booking_remote_data_source.dart'
    as _i322;
import 'package:guide_me/features/booking/data/data_sources/remote/booking_remote_data_source_impl.dart'
    as _i545;
import 'package:guide_me/features/booking/data/repos/booking_repo_impl.dart'
    as _i850;
import 'package:guide_me/features/booking/domain/repos/booking_repo.dart'
    as _i672;
import 'package:guide_me/features/booking/presentation/cubits/add_booking_cubit/add_booking_cubit.dart'
    as _i49;
import 'package:guide_me/features/booking/presentation/cubits/reservation_cubit/reservation_cubit.dart'
    as _i459;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i459.ReservationCubit>(() => _i459.ReservationCubit());
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
    gh.lazySingleton<_i322.BookingRemoteDataSource>(
      () => _i545.BookingRemoteDataSourceImpl(gh<_i947.ApiService>()),
    );
    gh.lazySingleton<_i672.BookingRepo>(
      () => _i850.BookingRepoImpl(gh<_i322.BookingRemoteDataSource>()),
    );
    gh.factory<_i49.AddBookingCubit>(
      () => _i49.AddBookingCubit(gh<_i672.BookingRepo>()),
    );
    return this;
  }
}
