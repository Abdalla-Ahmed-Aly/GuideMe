import 'dart:developer';

import 'package:guide_me/features/booking/domain/entities/booking_entity.dart';
import 'package:guide_me/features/booking/domain/enums/tourist_booking_status.dart';
import 'package:guide_me/features/guide_booking/domain/enums/guide_booking_status.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GuideBookingFilterUseCase {
  List<BookingEntity> filter({
    required List<BookingEntity> bookings,
    required GuideBookingStatus status,
  }) {
    log(status.name);
    if (status == GuideBookingStatus.completed) {
      return bookings
          .where((booking) => booking.status.name == status.name)
          .toList();
    } else if (status == GuideBookingStatus.live) {
      return bookings
          .where((booking) => booking.status.name == status.name)
          .toList();
    } else if (status == GuideBookingStatus.next) {
      return bookings
          .where(
            (booking) =>
                booking.status.name == TouristBookingStatus.pending.name ||
                booking.status.name == TouristBookingStatus.accepted.name,
          )
          .toList();
    }
    return bookings
        .where((booking) => booking.status.name == status.name)
        .toList();
  }
}
