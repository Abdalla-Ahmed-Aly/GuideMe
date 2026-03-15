import 'package:guide_me/features/booking/data/models/add_booking_request.dart';
import 'package:guide_me/features/booking/data/models/booking_model.dart';
import 'package:guide_me/features/booking/data/models/cancel_booking_response.dart';

abstract class BookingRemoteDataSource {
  Future<BookingModel> addBooking({
    required AddBookingRequest addBookingRequest,
  });
  Future<CancelBookingResponse> cancelBooking({required String bookingId});
  Future<List<BookingModel>> getBookings({
    required String? status,
    required String? date,
  });
}
