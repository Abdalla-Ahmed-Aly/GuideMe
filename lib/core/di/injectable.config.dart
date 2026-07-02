// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i409;
import 'package:get_it/get_it.dart' as _i174;
import 'package:guide_me/core/helpers/connectivity_helper.dart' as _i1;
import 'package:guide_me/core/location_core/data/data_sources/local/gps_local_data_source.dart'
    as _i250;
import 'package:guide_me/core/location_core/data/data_sources/local/gps_local_data_source_impl.dart'
    as _i923;
import 'package:guide_me/core/location_core/data/data_sources/remote/location_remote_data_source.dart'
    as _i602;
import 'package:guide_me/core/location_core/data/data_sources/remote/location_remote_data_source_impl.dart'
    as _i821;
import 'package:guide_me/core/location_core/data/repos/location_repo_impl.dart'
    as _i133;
import 'package:guide_me/core/location_core/domain/repos/location_repo.dart'
    as _i392;
import 'package:guide_me/core/location_core/domain/use_cases/get_current_location_use_case.dart'
    as _i448;
import 'package:guide_me/core/location_core/domain/use_cases/get_location_name_use_case.dart'
    as _i179;
import 'package:guide_me/core/location_core/domain/use_cases/search_location_use_case.dart'
    as _i510;
import 'package:guide_me/core/location_core/presentation/cubits/pick_location_cubit/pick_location_cubit.dart'
    as _i786;
import 'package:guide_me/core/network/api_service.dart' as _i947;
import 'package:guide_me/core/network/dio_service.dart' as _i516;
import 'package:guide_me/core/services/google_signIn_service.dart' as _i664;
import 'package:guide_me/core/services/media_picker_service/media_picker_service.dart'
    as _i226;
import 'package:guide_me/core/services/media_picker_service/media_picker_service_impl.dart'
    as _i159;
import 'package:guide_me/core/services/token/token_service.dart' as _i625;
import 'package:guide_me/core/services/token/token_service_impl.dart' as _i574;
import 'package:guide_me/core/shared/cubits/favorites_cubit/favorites_cubit.dart'
    as _i2;
import 'package:guide_me/core/shared/cubits/locale_cubit/locale_cubit.dart'
    as _i547;
import 'package:guide_me/core/shared/cubits/user_cubit/user_cubit.dart'
    as _i456;
import 'package:guide_me/core/shared/data_sources/favorites_local_data_source.dart'
    as _i760;
import 'package:guide_me/core/shared/data_sources/profile_local_data_source.dart'
    as _i912;
import 'package:guide_me/core/shared/repos/favorites_repo.dart' as _i490;
import 'package:guide_me/core/shared/repos/favorites_repo_impl.dart' as _i37;
import 'package:guide_me/core/shared/use_cases/clear_cached_user_usecase.dart'
    as _i407;
import 'package:guide_me/core/shared/use_cases/get_cached_user_usecase.dart'
    as _i388;
import 'package:guide_me/core/shared/use_cases/update_cached_user_usecase.dart'
    as _i157;
import 'package:guide_me/core/socket/socket_event_bus.dart' as _i248;
import 'package:guide_me/features/auth/data/data_source/Auth_remote_data_source.dart'
    as _i1043;
import 'package:guide_me/features/auth/data/repo/auth_repo_imple.dart' as _i80;
import 'package:guide_me/features/auth/domain/repo/auth_repo.dart' as _i956;
import 'package:guide_me/features/auth/domain/use_case/add_location_use_case.dart'
    as _i308;
import 'package:guide_me/features/auth/domain/use_case/login_use_case.dart'
    as _i93;
import 'package:guide_me/features/auth/domain/use_case/login_with_google_use_case.dart'
    as _i180;
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
import 'package:guide_me/features/auth/presentation/manager/location_access_cubit/location_access_cubit.dart'
    as _i545;
import 'package:guide_me/features/auth/presentation/manager/login_cubit/login_cubit.dart'
    as _i940;
import 'package:guide_me/features/auth/presentation/manager/login_with_google_cubit/login_with_google_cubit.dart'
    as _i459;
import 'package:guide_me/features/auth/presentation/manager/register_cubit/register_cubit.dart'
    as _i772;
import 'package:guide_me/features/auth/presentation/manager/resend_forget_password_cubit/resend_forget_password_cubit.dart'
    as _i968;
import 'package:guide_me/features/auth/presentation/manager/reset_password_cubit/reset_password_cubit.dart'
    as _i593;
import 'package:guide_me/features/auth/presentation/manager/select_nationality_cubit/select_nationality_cubit.dart'
    as _i105;
import 'package:guide_me/features/auth/presentation/manager/send_forget_password/send_forget_password_cubit.dart'
    as _i776;
import 'package:guide_me/features/auth/presentation/manager/verify_password_cubit/verify_password_cubit.dart'
    as _i577;
import 'package:guide_me/features/booking/data/data_sources/remote/booking_remote_data_source.dart'
    as _i322;
import 'package:guide_me/features/booking/data/data_sources/remote/booking_remote_data_source_impl.dart'
    as _i545;
import 'package:guide_me/features/booking/data/repos/booking_repo_impl.dart'
    as _i850;
import 'package:guide_me/features/booking/domain/repos/booking_repo.dart'
    as _i672;
import 'package:guide_me/features/booking/domain/use_cases/book_ai_package_use_case.dart'
    as _i664;
import 'package:guide_me/features/booking/domain/use_cases/book_package_use_case.dart'
    as _i280;
import 'package:guide_me/features/booking/domain/use_cases/get_bookings_use_case.dart'
    as _i12;
import 'package:guide_me/features/booking/domain/use_cases/get_guide_data_use_case.dart'
    as _i292;
import 'package:guide_me/features/booking/presentation/cubits/add_booking_cubit/add_booking_cubit.dart'
    as _i49;
import 'package:guide_me/features/booking/presentation/cubits/book_ai_package_cubit/book_ai_package_cubit.dart'
    as _i865;
import 'package:guide_me/features/booking/presentation/cubits/book_package_cubit/book_package_cubit.dart'
    as _i928;
import 'package:guide_me/features/booking/presentation/cubits/cancel_booking_cubit/cancel_booking_cubit.dart'
    as _i634;
import 'package:guide_me/features/booking/presentation/cubits/filter_cubit/filter_cubit.dart'
    as _i655;
import 'package:guide_me/features/booking/presentation/cubits/guide_data_cubit/guide_data_cubit.dart'
    as _i622;
import 'package:guide_me/features/booking/presentation/cubits/reservation_cubit/reservation_cubit.dart'
    as _i459;
import 'package:guide_me/features/booking/presentation/cubits/review_cubit/review_cubit.dart'
    as _i566;
import 'package:guide_me/features/booking/presentation/cubits/tourist_booking_cubit/tourist_booking_cubit.dart'
    as _i24;
import 'package:guide_me/features/chat/data/data_sources/remote/chat_remote_data_source.dart'
    as _i273;
import 'package:guide_me/features/chat/data/data_sources/remote/chat_remote_data_source_impl.dart'
    as _i94;
import 'package:guide_me/features/chat/data/repos/chat_repo_impl.dart' as _i214;
import 'package:guide_me/features/chat/domain/repos/chat_repo.dart' as _i870;
import 'package:guide_me/features/chat/domain/use_cases/get_all_chat_messages.dart'
    as _i1053;
import 'package:guide_me/features/chat/domain/use_cases/get_all_conversations_use_case.dart'
    as _i106;
import 'package:guide_me/features/chat/domain/use_cases/send_message_use_case.dart'
    as _i75;
import 'package:guide_me/features/dashboard/data/data_source/analysis_remote_data_source.dart'
    as _i389;
import 'package:guide_me/features/dashboard/data/data_source/dashboard_remote_data_source.dart'
    as _i209;
import 'package:guide_me/features/dashboard/data/repo/analysis_repo_imple.dart'
    as _i783;
import 'package:guide_me/features/dashboard/data/repo/dashboard_socket_repos_imple.dart'
    as _i1010;
import 'package:guide_me/features/dashboard/data/repo/toggle_online_repository_impl.dart'
    as _i781;
import 'package:guide_me/features/dashboard/domain/repo/analysis_repo.dart'
    as _i539;
import 'package:guide_me/features/dashboard/domain/repo/dashboard_socket_repo.dart'
    as _i480;
import 'package:guide_me/features/dashboard/domain/repo/toggle_online_repository%20.dart'
    as _i742;
import 'package:guide_me/features/dashboard/domain/use_case/accept_booking_use_case.dart'
    as _i120;
import 'package:guide_me/features/dashboard/domain/use_case/accept_package_use_case.dart'
    as _i85;
import 'package:guide_me/features/dashboard/domain/use_case/decline_booking_use_case.dart'
    as _i929;
import 'package:guide_me/features/dashboard/domain/use_case/get_analysis_use_case%20.dart'
    as _i268;
import 'package:guide_me/features/dashboard/domain/use_case/get_requests_history_use_case.dart'
    as _i542;
import 'package:guide_me/features/dashboard/presentation/cubits/accept_and_decline_cubit/accept_booking_cubit.dart'
    as _i938;
import 'package:guide_me/features/dashboard/presentation/cubits/accept_package_cubit/accept_package_cubit.dart'
    as _i560;
import 'package:guide_me/features/dashboard/presentation/cubits/Analysis_Cubit/analysis_cubit.dart'
    as _i11;
import 'package:guide_me/features/dashboard/presentation/cubits/Toogle_Online_Status/toogle_online_status_cubit.dart'
    as _i916;
import 'package:guide_me/features/guide_booking/data/data_sources/remote/guide_booking_remote_data_source.dart'
    as _i221;
import 'package:guide_me/features/guide_booking/data/data_sources/remote/guide_booking_remote_data_source_impl.dart'
    as _i928;
import 'package:guide_me/features/guide_booking/data/repos/guide_booking_repo_impl.dart'
    as _i367;
import 'package:guide_me/features/guide_booking/domain/repos/guide_booking_repo.dart'
    as _i580;
import 'package:guide_me/features/guide_booking/domain/use_cases/get_guide_booking_use_case.dart'
    as _i479;
import 'package:guide_me/features/guide_booking/domain/use_cases/guide_booking_filter_use_case.dart'
    as _i384;
import 'package:guide_me/features/guide_booking/presentation/cubits/guide_booking_action_cubit/guide_booking_actions_cubit.dart'
    as _i123;
import 'package:guide_me/features/guide_booking/presentation/widgets/guide_booking_status_filter.dart'
    as _i758;
import 'package:guide_me/features/guide_profile/data/data_sources/remote/guide_profile_remote_data_source.dart'
    as _i1036;
import 'package:guide_me/features/guide_profile/data/data_sources/remote/guide_profile_remote_data_source_impl.dart'
    as _i688;
import 'package:guide_me/features/guide_profile/data/repos/guide_profile_repo_impl.dart'
    as _i904;
import 'package:guide_me/features/guide_profile/domain/repos/guide_profile_repo.dart'
    as _i543;
import 'package:guide_me/features/guide_profile/domain/use_cases/add_certification_use_case.dart'
    as _i898;
import 'package:guide_me/features/guide_profile/domain/use_cases/delete_certificate_use_case.dart'
    as _i123;
import 'package:guide_me/features/guide_profile/domain/use_cases/update_bio_use_case.dart'
    as _i412;
import 'package:guide_me/features/guide_profile/domain/use_cases/update_languages_use_case.dart'
    as _i296;
import 'package:guide_me/features/guide_profile/presentation/cubits/add_certification_cubit/add_certification_cubit.dart'
    as _i777;
import 'package:guide_me/features/guide_profile/presentation/cubits/guide_profile_cubit/guide_profile_cubit.dart'
    as _i248;
import 'package:guide_me/features/guide_registration/data/repositories/guide_registration_repository.dart'
    as _i554;
import 'package:guide_me/features/guide_registration/data/sources/guide_registration_data_source.dart'
    as _i89;
import 'package:guide_me/features/guide_registration/presentation/cubits/get_categories/get_categories_cubit.dart'
    as _i1024;
import 'package:guide_me/features/guide_registration/presentation/cubits/get_cities/get_cities_cubit.dart'
    as _i1049;
import 'package:guide_me/features/guide_registration/presentation/cubits/guide_registration_shared_cubit/guide_registration_shared_cubit.dart'
    as _i698;
import 'package:guide_me/features/guide_registration/presentation/cubits/verification_status/verification_status_cubit.dart'
    as _i537;
import 'package:guide_me/features/home/data/repo_impl/home_repo_impl.dart'
    as _i955;
import 'package:guide_me/features/home/data/sources/home_sources.dart' as _i692;
import 'package:guide_me/features/home/domain/repo/home_repo.dart' as _i1045;
import 'package:guide_me/features/home/domain/usecases/add_interests_use_case.dart'
    as _i726;
import 'package:guide_me/features/home/domain/usecases/get_ai_package_usecase.dart'
    as _i806;
import 'package:guide_me/features/home/domain/usecases/get_categories_usecase.dart'
    as _i187;
import 'package:guide_me/features/home/domain/usecases/get_home_usecase.dart'
    as _i367;
import 'package:guide_me/features/home/domain/usecases/place_by_category_usecase.dart'
    as _i205;
import 'package:guide_me/features/home/domain/usecases/place_by_city_usecase.dart'
    as _i985;
import 'package:guide_me/features/home/presentation/cubits/get_ai_package/get_ai_package_cubit.dart'
    as _i842;
import 'package:guide_me/features/home/presentation/cubits/get_home_data/get_home_cubit.dart'
    as _i792;
import 'package:guide_me/features/home/presentation/cubits/get_place_by_category/place_by_category_cubit.dart'
    as _i554;
import 'package:guide_me/features/home/presentation/cubits/get_place_by_city/place_by_city_cubit.dart'
    as _i137;
import 'package:guide_me/features/home/presentation/cubits/interests_cubit/interests_cubit.dart'
    as _i50;
import 'package:guide_me/features/home/presentation/cubits/nav_bar_cubit/tourist_nav_bar_cubit.dart'
    as _i140;
import 'package:guide_me/features/profile/data/data_sources/profile_remote_data_source.dart'
    as _i243;
import 'package:guide_me/features/profile/data/repos/profile_repo_impl.dart'
    as _i165;
import 'package:guide_me/features/profile/domain/repos/profile_repo.dart'
    as _i948;
import 'package:guide_me/features/profile/domain/use_cases/update_profile_use_case.dart'
    as _i838;
import 'package:guide_me/features/profile/presentation/cubits/logout_cubit/logout_cubit.dart'
    as _i1073;
import 'package:guide_me/features/profile/presentation/cubits/update_profile_cubit/update_profile_cubit.dart'
    as _i385;
import 'package:guide_me/features/splash/presentation/cubits/splash_cubit/splash_cubit.dart'
    as _i306;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i459.ReservationCubit>(() => _i459.ReservationCubit());
    gh.factory<_i140.TouristNavBarCubit>(() => _i140.TouristNavBarCubit());
    gh.lazySingleton<_i1.ConnectivityHelper>(() => _i1.ConnectivityHelper());
    gh.lazySingleton<_i516.DioService>(() => _i516.DioService());
    gh.lazySingleton<_i664.GoogleAuthService>(() => _i664.GoogleAuthService());
    gh.lazySingleton<_i547.LocaleCubit>(() => _i547.LocaleCubit());
    gh.lazySingleton<_i384.GuideBookingFilterUseCase>(
      () => _i384.GuideBookingFilterUseCase(),
    );
    gh.lazySingleton<_i367.GetHomeUsecase>(() => _i367.GetHomeUsecase());
    gh.lazySingleton<_i205.PlaceByCategoryUsecase>(
      () => _i205.PlaceByCategoryUsecase(),
    );
    gh.lazySingleton<_i985.PlaceByCityUsecase>(
      () => _i985.PlaceByCityUsecase(),
    );
    gh.lazySingleton<_i947.ApiService>(
      () => _i947.ApiService(
        gh<_i516.DioService>(),
        gh<_i1.ConnectivityHelper>(),
      ),
    );
    gh.lazySingleton<_i389.AnalysisRemoteDataSource>(
      () => _i389.AnalysisRemoteDataSourceImple(gh<_i947.ApiService>()),
    );
    gh.lazySingleton<_i250.GpsLocalDataSource>(
      () => _i923.GpsLocalDataSourceImpl(),
    );
    gh.lazySingleton<_i625.TokenService>(() => _i574.TokenServiceImpl());
    gh.lazySingleton<_i209.DashboardRemoteDataSource>(
      () => _i209.DashboardRemoteDataSourceImpl(gh<_i947.ApiService>()),
    );
    gh.lazySingleton<_i226.MediaPickerService>(
      () => _i159.MediaPickerServiceImpl(),
    );
    gh.lazySingleton<_i539.AnalysisRepo>(
      () => _i783.AnalysisRepoImple(gh<_i389.AnalysisRemoteDataSource>()),
    );
    gh.lazySingleton<_i758.GuideBookingStatusFilter>(
      () => _i758.GuideBookingStatusFilter(key: gh<_i409.Key>()),
    );
    gh.lazySingleton<_i760.FavoritesLocalDataSource>(
      () => _i760.FavoritesLocalDataSourceImpl(),
    );
    gh.lazySingleton<_i912.ProfileLocalDataSource>(
      () => _i912.ProfileLocalDataSourceImpl(),
    );
    gh.lazySingleton<_i1043.AuthRemoteDataSource>(
      () => _i1043.AuthRemoteDataSourceImpl(gh<_i947.ApiService>()),
    );
    gh.lazySingleton<_i742.ToggleOnlineRepository>(
      () =>
          _i781.ToggleOnlineRepositoryImpl(apiService: gh<_i947.ApiService>()),
    );
    gh.lazySingleton<_i602.LocationRemoteDataSource>(
      () => _i821.LocationRemoteDataSourceImpl(gh<_i947.ApiService>()),
    );
    gh.factory<_i137.PlaceByCityCubit>(
      () => _i137.PlaceByCityCubit(gh<_i985.PlaceByCityUsecase>()),
    );
    gh.lazySingleton<_i273.ChatRemoteDataSource>(
      () => _i94.ChatRemoteDataSourceImpl(gh<_i947.ApiService>()),
    );
    gh.factory<_i554.GuideRegistrationRepository>(
      () => _i554.GuideRegistrationRepository(gh<_i947.ApiService>()),
    );
    gh.factory<_i89.GuideRegistrationDataSource>(
      () => _i89.GuideRegistrationDataSource(gh<_i947.ApiService>()),
    );
    gh.lazySingleton<_i322.BookingRemoteDataSource>(
      () => _i545.BookingRemoteDataSourceImpl(gh<_i947.ApiService>()),
    );
    gh.lazySingleton<_i221.GuideBookingRemoteDataSource>(
      () => _i928.GuideBookingRemoteDataSourceImpl(gh<_i947.ApiService>()),
    );
    gh.lazySingleton<_i480.DashboardSocketRepository>(
      () => _i1010.DashboardSocketRepositoryImpl(
        gh<_i209.DashboardRemoteDataSource>(),
        gh<_i248.SocketEventBus>(),
      ),
    );
    gh.lazySingleton<_i490.FavoritesRepo>(
      () => _i37.FavoritesRepoImpl(gh<_i760.FavoritesLocalDataSource>()),
    );
    gh.lazySingleton<_i243.ProfileRemoteDataSource>(
      () => _i243.ProfileRemoteDataSourceImpl(gh<_i947.ApiService>()),
    );
    gh.factory<_i554.PlaceByCategoryCubit>(
      () => _i554.PlaceByCategoryCubit(gh<_i205.PlaceByCategoryUsecase>()),
    );
    gh.factory<_i1049.GetCitiesCubit>(
      () => _i1049.GetCitiesCubit(gh<_i89.GuideRegistrationDataSource>()),
    );
    gh.lazySingleton<_i1036.GuideProfileRemoteDataSource>(
      () => _i688.GuideProfileRemoteDataSourceImpl(gh<_i947.ApiService>()),
    );
    gh.lazySingleton<_i692.HomeService>(
      () => _i692.HomeApiServiceImpl(gh<_i947.ApiService>()),
    );
    gh.lazySingleton<_i392.LocationRepo>(
      () => _i133.LocationRepoImpl(
        gh<_i602.LocationRemoteDataSource>(),
        gh<_i250.GpsLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i580.GuideBookingRepo>(
      () =>
          _i367.GuideBookingRepoImpl(gh<_i221.GuideBookingRemoteDataSource>()),
    );
    gh.factory<_i2.FavoritesCubit>(
      () => _i2.FavoritesCubit(gh<_i490.FavoritesRepo>()),
    );
    gh.lazySingleton<_i543.GuideProfileRepo>(
      () =>
          _i904.GuideProfileRepoImpl(gh<_i1036.GuideProfileRemoteDataSource>()),
    );
    gh.factory<_i306.SplashCubit>(
      () => _i306.SplashCubit(gh<_i625.TokenService>()),
    );
    gh.factory<_i120.AcceptBookingUseCase>(
      () => _i120.AcceptBookingUseCase(gh<_i480.DashboardSocketRepository>()),
    );
    gh.factory<_i929.DeclineBookingUseCase>(
      () => _i929.DeclineBookingUseCase(gh<_i480.DashboardSocketRepository>()),
    );
    gh.factory<_i542.GetRequestsHistoryUseCase>(
      () => _i542.GetRequestsHistoryUseCase(
        gh<_i480.DashboardSocketRepository>(),
      ),
    );
    gh.lazySingleton<_i85.AcceptPackageUseCase>(
      () => _i85.AcceptPackageUseCase(gh<_i480.DashboardSocketRepository>()),
    );
    gh.lazySingleton<_i898.AddCertificationUseCase>(
      () => _i898.AddCertificationUseCase(gh<_i543.GuideProfileRepo>()),
    );
    gh.lazySingleton<_i123.DeleteCertificateUseCase>(
      () => _i123.DeleteCertificateUseCase(gh<_i543.GuideProfileRepo>()),
    );
    gh.lazySingleton<_i412.UpdateBioUseCase>(
      () => _i412.UpdateBioUseCase(gh<_i543.GuideProfileRepo>()),
    );
    gh.lazySingleton<_i296.UpdateLanguagesUseCase>(
      () => _i296.UpdateLanguagesUseCase(gh<_i543.GuideProfileRepo>()),
    );
    gh.factory<_i268.GetAnalysisUseCase>(
      () => _i268.GetAnalysisUseCase(gh<_i539.AnalysisRepo>()),
    );
    gh.lazySingleton<_i407.ClearCachedUserUsecase>(
      () => _i407.ClearCachedUserUsecase(gh<_i912.ProfileLocalDataSource>()),
    );
    gh.lazySingleton<_i388.GetCachedUserUsecase>(
      () => _i388.GetCachedUserUsecase(gh<_i912.ProfileLocalDataSource>()),
    );
    gh.lazySingleton<_i157.UpdateCachedUserUsecase>(
      () => _i157.UpdateCachedUserUsecase(gh<_i912.ProfileLocalDataSource>()),
    );
    gh.lazySingleton<_i948.ProfileRepo>(
      () => _i165.ProfileRepoImpl(
        gh<_i912.ProfileLocalDataSource>(),
        gh<_i243.ProfileRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i479.GetGuideBookingUseCase>(
      () => _i479.GetGuideBookingUseCase(gh<_i580.GuideBookingRepo>()),
    );
    gh.lazySingleton<_i956.AuthRepo>(
      () => _i80.AuthRepoImple(
        gh<_i1043.AuthRemoteDataSource>(),
        gh<_i625.TokenService>(),
      ),
    );
    gh.factory<_i916.ToggleOnlineStatusCubit>(
      () => _i916.ToggleOnlineStatusCubit(gh<_i742.ToggleOnlineRepository>()),
    );
    gh.factory<_i1073.LogoutCubit>(
      () => _i1073.LogoutCubit(gh<_i948.ProfileRepo>()),
    );
    gh.lazySingleton<_i838.UpdateProfileUseCase>(
      () => _i838.UpdateProfileUseCase(gh<_i948.ProfileRepo>()),
    );
    gh.lazySingleton<_i1045.HomeRepo>(
      () => _i955.HomeRepoImpl(gh<_i692.HomeService>()),
    );
    gh.factory<_i248.GuideProfileCubit>(
      () => _i248.GuideProfileCubit(
        gh<_i412.UpdateBioUseCase>(),
        gh<_i296.UpdateLanguagesUseCase>(),
      ),
    );
    gh.lazySingleton<_i698.GuideRegistrationSharedCubit>(
      () => _i698.GuideRegistrationSharedCubit(
        gh<_i554.GuideRegistrationRepository>(),
        gh<_i226.MediaPickerService>(),
      ),
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
    gh.factory<_i105.SelectNationalityCubit>(
      () => _i105.SelectNationalityCubit(gh<_i956.AuthRepo>()),
    );
    gh.lazySingleton<_i308.AddLocationUseCase>(
      () => _i308.AddLocationUseCase(gh<_i956.AuthRepo>()),
    );
    gh.factory<_i593.ResetPasswordCubit>(
      () => _i593.ResetPasswordCubit(gh<_i865.ResetPasswordUseCase>()),
    );
    gh.factory<_i537.VerificationStatusCubit>(
      () => _i537.VerificationStatusCubit(
        gh<_i554.GuideRegistrationRepository>(),
      ),
    );
    gh.lazySingleton<_i870.ChatRepo>(
      () => _i214.ChatRepoImpl(gh<_i273.ChatRemoteDataSource>()),
    );
    gh.factory<_i11.AnalysisCubit>(
      () => _i11.AnalysisCubit(gh<_i268.GetAnalysisUseCase>()),
    );
    gh.lazySingleton<_i672.BookingRepo>(
      () => _i850.BookingRepoImpl(gh<_i322.BookingRemoteDataSource>()),
    );
    gh.lazySingleton<_i448.GetCurrentLocationUseCase>(
      () => _i448.GetCurrentLocationUseCase(gh<_i392.LocationRepo>()),
    );
    gh.lazySingleton<_i179.GetLocationNameUseCase>(
      () => _i179.GetLocationNameUseCase(gh<_i392.LocationRepo>()),
    );
    gh.lazySingleton<_i510.SearchLocationUseCase>(
      () => _i510.SearchLocationUseCase(gh<_i392.LocationRepo>()),
    );
    gh.factory<_i456.UserCubit>(
      () => _i456.UserCubit(
        gh<_i388.GetCachedUserUsecase>(),
        gh<_i407.ClearCachedUserUsecase>(),
        gh<_i157.UpdateCachedUserUsecase>(),
      ),
    );
    gh.factory<_i93.LoginUseCase>(
      () => _i93.LoginUseCase(gh<_i956.AuthRepo>()),
    );
    gh.factory<_i885.RegisterUseCase>(
      () => _i885.RegisterUseCase(gh<_i956.AuthRepo>()),
    );
    gh.factory<_i393.VerifyForgetPasswordUseCase>(
      () => _i393.VerifyForgetPasswordUseCase(gh<_i956.AuthRepo>()),
    );
    gh.lazySingleton<_i1053.GetAllChatMessagesUseCase>(
      () => _i1053.GetAllChatMessagesUseCase(gh<_i870.ChatRepo>()),
    );
    gh.lazySingleton<_i106.GetAllConversationsUseCase>(
      () => _i106.GetAllConversationsUseCase(gh<_i870.ChatRepo>()),
    );
    gh.lazySingleton<_i75.SendMessageUseCase>(
      () => _i75.SendMessageUseCase(gh<_i870.ChatRepo>()),
    );
    gh.factory<_i938.AcceptBookingCubit>(
      () => _i938.AcceptBookingCubit(
        gh<_i120.AcceptBookingUseCase>(),
        gh<_i929.DeclineBookingUseCase>(),
      ),
    );
    gh.factory<_i123.GuideBookingActionsCubit>(
      () => _i123.GuideBookingActionsCubit(gh<_i580.GuideBookingRepo>()),
    );
    gh.factory<_i545.LocationAccessCubit>(
      () => _i545.LocationAccessCubit(
        gh<_i308.AddLocationUseCase>(),
        gh<_i448.GetCurrentLocationUseCase>(),
      ),
    );
    gh.factory<_i385.UpdateProfileCubit>(
      () => _i385.UpdateProfileCubit(
        gh<_i838.UpdateProfileUseCase>(),
        gh<_i448.GetCurrentLocationUseCase>(),
        gh<_i226.MediaPickerService>(),
      ),
    );
    gh.factory<_i1024.GetCategoriesCubit>(
      () => _i1024.GetCategoriesCubit(gh<_i1045.HomeRepo>()),
    );
    gh.factory<_i792.GetHomeCubit>(
      () => _i792.GetHomeCubit(gh<_i1045.HomeRepo>()),
    );
    gh.factory<_i777.AddCertificationCubit>(
      () => _i777.AddCertificationCubit(
        gh<_i898.AddCertificationUseCase>(),
        gh<_i226.MediaPickerService>(),
        gh<_i123.DeleteCertificateUseCase>(),
      ),
    );
    gh.factory<_i49.AddBookingCubit>(
      () => _i49.AddBookingCubit(gh<_i672.BookingRepo>()),
    );
    gh.factory<_i634.CancelBookingCubit>(
      () => _i634.CancelBookingCubit(gh<_i672.BookingRepo>()),
    );
    gh.factory<_i655.FilterCubit>(
      () => _i655.FilterCubit(gh<_i672.BookingRepo>()),
    );
    gh.factory<_i566.ReviewCubit>(
      () => _i566.ReviewCubit(gh<_i672.BookingRepo>()),
    );
    gh.lazySingleton<_i12.GetBookingsUseCase>(
      () => _i12.GetBookingsUseCase(gh<_i672.BookingRepo>()),
    );
    gh.lazySingleton<_i292.GetGuideDataUseCase>(
      () => _i292.GetGuideDataUseCase(gh<_i672.BookingRepo>()),
    );
    gh.factory<_i180.LoginWithGoogleUseCase>(
      () => _i180.LoginWithGoogleUseCase(
        gh<_i956.AuthRepo>(),
        gh<_i664.GoogleAuthService>(),
      ),
    );
    gh.factory<_i577.VerifyPasswordCubit>(
      () => _i577.VerifyPasswordCubit(gh<_i393.VerifyForgetPasswordUseCase>()),
    );
    gh.factory<_i24.TouristBookingCubit>(
      () => _i24.TouristBookingCubit(gh<_i12.GetBookingsUseCase>()),
    );
    gh.lazySingleton<_i726.AddInterestsUseCase>(
      () => _i726.AddInterestsUseCase(gh<_i1045.HomeRepo>()),
    );
    gh.lazySingleton<_i806.GetAiPackageUsecase>(
      () => _i806.GetAiPackageUsecase(gh<_i1045.HomeRepo>()),
    );
    gh.lazySingleton<_i187.GetCategoriesUsecase>(
      () => _i187.GetCategoriesUsecase(gh<_i1045.HomeRepo>()),
    );
    gh.factory<_i772.RegisterCubit>(
      () => _i772.RegisterCubit(gh<_i885.RegisterUseCase>()),
    );
    gh.factory<_i560.PackageActionsCubit>(
      () => _i560.PackageActionsCubit(gh<_i85.AcceptPackageUseCase>()),
    );
    gh.factory<_i50.InterestsCubit>(
      () => _i50.InterestsCubit(
        gh<_i187.GetCategoriesUsecase>(),
        gh<_i726.AddInterestsUseCase>(),
      ),
    );
    gh.factory<_i622.GuideDataCubit>(
      () => _i622.GuideDataCubit(gh<_i292.GetGuideDataUseCase>()),
    );
    gh.factory<_i842.GetAiPackageCubit>(
      () => _i842.GetAiPackageCubit(gh<_i806.GetAiPackageUsecase>()),
    );
    gh.factory<_i776.SendForgetPasswordCubit>(
      () =>
          _i776.SendForgetPasswordCubit(gh<_i814.SendForgetPasswordUseCase>()),
    );
    gh.lazySingleton<_i664.BookAiPackageUseCase>(
      () => _i664.BookAiPackageUseCase(gh<_i672.BookingRepo>()),
    );
    gh.factory<_i968.ResendForgetPasswordCubit>(
      () => _i968.ResendForgetPasswordCubit(gh<_i426.ResendPasswordUseCase>()),
    );
    gh.factory<_i786.PickLocationCubit>(
      () => _i786.PickLocationCubit(
        gh<_i448.GetCurrentLocationUseCase>(),
        gh<_i179.GetLocationNameUseCase>(),
        gh<_i510.SearchLocationUseCase>(),
      ),
    );
    gh.lazySingleton<_i280.BookPackageUseCase>(
      () => _i280.BookPackageUseCase(gh<_i672.BookingRepo>()),
    );
    gh.factory<_i459.LoginwithGoogleCubit>(
      () => _i459.LoginwithGoogleCubit(gh<_i180.LoginWithGoogleUseCase>()),
    );
    gh.factory<_i940.LoginCubit>(
      () => _i940.LoginCubit(gh<_i93.LoginUseCase>()),
    );
    gh.factory<_i928.BookPackageCubit>(
      () => _i928.BookPackageCubit(gh<_i280.BookPackageUseCase>()),
    );
    gh.factory<_i865.BookAiPackageCubit>(
      () => _i865.BookAiPackageCubit(gh<_i664.BookAiPackageUseCase>()),
    );
    return this;
  }
}
