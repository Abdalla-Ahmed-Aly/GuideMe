import 'package:dartz/dartz.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/features/booking/data/models/add_booking_request.dart';
import 'package:guide_me/features/booking/data/models/cancel_booking_response.dart';
import 'package:guide_me/features/booking/domain/entities/booking_entity.dart';

abstract class BookingRepo {
  Future<Either<Failure, BookingEntity>> addBooking({
    required AddBookingRequest addBookingRequest,
  });
  Future<Either<Failure, CancelBookingResponse>> cancelBooking({
    required String bookingId,
  });
}