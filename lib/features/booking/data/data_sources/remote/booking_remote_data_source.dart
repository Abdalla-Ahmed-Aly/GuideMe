import 'package:guide_me/features/booking/data/models/add_booking_request.dart';
import 'package:guide_me/features/booking/data/models/booking_model.dart';

abstract class BookingRemoteDataSource {
  Future<BookingModel> addBooking({required AddBookingRequest addBookingRequest});
}