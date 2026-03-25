import 'package:dio/dio.dart';
import 'package:guide_me/core/constants/api_constants.dart';
import 'package:guide_me/core/shared/models/city_model.dart';
import 'package:guide_me/core/network/api_service.dart';
import 'package:guide_me/core/shared/models/user_model.dart';
import 'package:guide_me/features/booking/data/data_sources/remote/booking_remote_data_source.dart';
import 'package:guide_me/features/booking/data/models/add_booking_request.dart';
import 'package:guide_me/features/booking/data/models/book_ai_package_request.dart';
import 'package:guide_me/features/booking/data/models/book_package_response_model.dart';
import 'package:guide_me/features/booking/data/models/booking_model.dart';
import 'package:guide_me/features/booking/data/models/booking_package_request_model.dart';
import 'package:guide_me/features/booking/data/models/booking_packge_model.dart';
import 'package:guide_me/features/booking/data/models/cancel_booking_response.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: BookingRemoteDataSource)
class BookingRemoteDataSourceImpl implements BookingRemoteDataSource {
  final ApiService _apiService;
  CancelToken? _cancelToken;

  BookingRemoteDataSourceImpl(this._apiService);

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
  Future<CancelBookingResponse> cancelBooking({
    required String bookingId,
  }) async {
    final response = await _apiService.patch(
      endpoint:
          "${ApiConstants.addBookingEndpoint}/$bookingId${ApiConstants.cancelBookingEndpoint}",
    );
    return CancelBookingResponse.fromJson(response.data["data"]["booking"]);
  }

  @override
  Future<List<BookingModel>> getBookings({
    required String? status,
    required String? date,
  }) async {
    _cancelToken?.cancel();
    _cancelToken = CancelToken();

    final response = await _apiService.get(
      endpoint: ApiConstants.myScheduleEndpoint,
      queryParameters: {
        if (date != null) "date": date,
        if (status != null) "status": status,
      },
      cancelToken: _cancelToken,
    );
    return (response.data["data"]["bookings"] as List<dynamic>)
        .map((e) => BookingModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<CityModel>> getCities() async {
    final response = await _apiService.get(
      endpoint: ApiConstants.citiesEndpoint,
    );
    return (response.data["data"] as List<dynamic>)
        .map((e) => CityModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<BookingPackgeModel>> getSuggestionPackages({
    required String city,
    required double budget,
  }) async {
    final response = await _apiService.get(
      endpoint: ApiConstants.suggestionsEndpoint,
      queryParameters: {
        "city": city,
        "budget": budget,
      },
    );
    return (response.data["data"] as List<dynamic>)
        .map((e) => BookingPackgeModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<BookPackageResponseModel> bookPackage({
    required BookingPackageRequestModel bookingPackageRequestModel,
  }) async {
    final response = await _apiService.post(
      endpoint: ApiConstants.bookPackageEndpoint,
      data: bookingPackageRequestModel.toJson(),
    );
    return BookPackageResponseModel.fromJson(response.data["data"]);
  }

  @override
  Future<UserModel> getGuideData({required String guideId}) async {
    final response = await _apiService.get(
      endpoint: "${ApiConstants.userProfileEndpoint}/$guideId",
    );
    return UserModel.fromJson(response.data["data"]);
  }

  @override
  Future<BookPackageResponseModel> bookAiPackage({
    required BookAiPackageRequest bookAi,
  }) async {
    final response = await _apiService.post(
      endpoint: ApiConstants.bookAiPackageEndpoint,
      data: bookAi.toJson(),
    );
    return BookPackageResponseModel.fromJson(response.data['data']);
  }
}
