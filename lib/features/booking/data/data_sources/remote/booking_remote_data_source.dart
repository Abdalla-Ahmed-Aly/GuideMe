import 'package:guide_me/core/models/city_model.dart';
import 'package:guide_me/features/booking/data/models/add_booking_request.dart';
import 'package:guide_me/features/booking/data/models/book_package_response_model.dart';
import 'package:guide_me/features/booking/data/models/booking_model.dart';
import 'package:guide_me/features/booking/data/models/booking_package_request_model.dart';
import 'package:guide_me/features/booking/data/models/booking_packge_model.dart';
import 'package:guide_me/features/booking/data/models/cancel_booking_response.dart';
import 'package:guide_me/features/booking/data/models/guider_models/guide_details_model.dart';

abstract class BookingRemoteDataSource {
  Future<BookingModel> addBooking({
    required AddBookingRequest addBookingRequest,
  });
  Future<CancelBookingResponse> cancelBooking({required String bookingId});
  Future<List<BookingModel>> getBookings({
    required String? status,
    required String? date,
  });

  Future<List<CityModel>> getCities();
  Future<List<BookingPackgeModel>> getSuggestionPackages({
    required String city,
    required double budget,
  });

  Future<BookPackageResponseModel> bookPackage({
    required BookingPackageRequestModel bookingPackageRequestModel,
  });

  Future<GuideDetailsModel> getGuideData({required String guideId});
}
