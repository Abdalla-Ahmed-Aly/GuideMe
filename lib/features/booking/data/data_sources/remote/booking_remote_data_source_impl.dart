import 'package:guide_me/core/constants/api_constants.dart';
import 'package:guide_me/core/network/api_service.dart';
import 'package:guide_me/features/booking/data/data_sources/remote/booking_remote_data_source.dart';
import 'package:guide_me/features/booking/data/models/add_booking_request.dart';
import 'package:guide_me/features/booking/data/models/booking_model.dart';
import 'package:guide_me/features/booking/data/models/cancel_booking_response.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: BookingRemoteDataSource)
class BookingRemoteDataSourceImpl implements BookingRemoteDataSource {
  final ApiService _apiService;

  const BookingRemoteDataSourceImpl(this._apiService);

  @override
  Future<BookingModel> addBooking({
    required AddBookingRequest addBookingRequest,
  }) async {
    final response = await _apiService.post(
      endpoint: ApiConstants.addBookingEndpoint,
      data: addBookingRequest.toJson(),
    );
    return BookingModel.fromJson(response.data["data"]);
  }

  @override
  Future<CancelBookingResponse> cancelBooking({required String bookingId}) async {
    final response = await _apiService.patch(
      endpoint:
          "${ApiConstants.addBookingEndpoint}/$bookingId${ApiConstants.cancelBookingEndpoint}",
    );
    return CancelBookingResponse.fromJson(response.data["data"]["booking"]);
  }
}
