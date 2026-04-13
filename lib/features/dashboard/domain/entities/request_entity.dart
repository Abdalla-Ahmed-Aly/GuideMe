import 'package:guide_me/features/booking/domain/entities/booking_entity.dart';

class RequestEntity {
  final String type;
  final String? packageId;
  final List<BookingEntity>? bookings;
  final BookingEntity? booking;

  RequestEntity({
    required this.type,
    required this.packageId,
    required this.bookings,
    required this.booking,
  });
}
