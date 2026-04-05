import 'package:dio/dio.dart';
import 'package:guide_me/core/constants/api_constants.dart';
import 'package:guide_me/core/network/api_service.dart';
import 'package:guide_me/features/booking/data/models/booking_model.dart';
import 'package:injectable/injectable.dart';
import 'package:guide_me/features/guide_booking/data/data_sources/remote/guide_booking_remote_data_source.dart';

@LazySingleton(as: GuideBookingRemoteDataSource)
class GuideBookingRemoteDataSourceImpl implements GuideBookingRemoteDataSource {
  final ApiService _apiService;
  CancelToken? _cancelToken;
  GuideBookingRemoteDataSourceImpl(this._apiService);

  @override
  Future<List<BookingModel>> getGuideBooking({
    required String? date,
  }) async {
    _cancelToken?.cancel();
    _cancelToken = CancelToken();

    final response = await _apiService.get(
      endpoint: ApiConstants.guideScheduleEndpoint,
      queryParameters: {
        if (date != null) "date": date,
      },
      cancelToken: _cancelToken,
    );
    return (response.data["data"]["bookings"] as List<dynamic>)
        .map((e) => BookingModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
