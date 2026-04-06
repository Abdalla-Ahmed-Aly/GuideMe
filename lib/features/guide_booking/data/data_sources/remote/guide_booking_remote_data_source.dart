import 'package:guide_me/features/booking/data/models/booking_model.dart';

abstract class GuideBookingRemoteDataSource {
  Future<List<BookingModel>> getGuideBooking({
    required String? date,
  });
  Future<void> startTour({required String bookingId});
  Future<void> endTour({required String bookingId});
}