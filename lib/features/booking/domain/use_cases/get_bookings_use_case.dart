import 'package:dartz/dartz.dart';
import 'package:guide_me/features/booking/domain/enums/tourist_booking_status.dart';
import 'package:injectable/injectable.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/features/booking/domain/entities/booking_entity.dart';
import 'package:guide_me/features/booking/domain/repos/booking_repo.dart';
import 'package:intl/intl.dart';

@lazySingleton
class GetBookingsUseCase {
  final BookingRepo _bookingRepo;

  const GetBookingsUseCase(this._bookingRepo);

  Future<Either<Failure, List<BookingEntity>>> call({
    required TouristBookingStatus status,
    required DateTime? date,
  }) async {
    
    final formattedDate = date != null
        ? DateFormat("yyyy-MM-dd").format(date)
        : null;

    final statusName = status == TouristBookingStatus.live ? null : status.name;

    final result = await _bookingRepo.getBookings(
      status: statusName,
      date: formattedDate,
    );

    return switch (status) {
      TouristBookingStatus.pending => result.map(
        (bookings) => bookings.where((booking) {
          return booking.status == TouristBookingStatus.pending;
        }).toList(),
      ),
      TouristBookingStatus.live => result.map(
        (bookings) => bookings.where((booking) {
          return booking.status == TouristBookingStatus.live ||
              booking.status == TouristBookingStatus.accepted;
        }).toList(),
      ),
      _ => result,
    };
  }
}
