import 'package:guide_me/features/booking/data/models/booking_model.dart';

abstract class GuideBookingRemoteDataSource {
  Future<List<BookingModel>> getGuideBooking({
    required String? date,
  });
}