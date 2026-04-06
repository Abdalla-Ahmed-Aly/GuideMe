import 'package:dartz/dartz.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/features/booking/domain/entities/booking_entity.dart';

abstract class GuideBookingRepo {
  Future<Either<Failure, List<BookingEntity>>> getGuideBooking({
    required String? date,
  });
  Future<Either<Failure, void>> startTour({required String bookingId});
  Future<Either<Failure, void>> endTour({required String bookingId});
}