import 'package:dartz/dartz.dart';
import 'package:guide_me/core/errors/error_handler.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/features/booking/data/data_sources/remote/booking_remote_data_source.dart';
import 'package:guide_me/features/booking/data/mappers/booking_mapper.dart';
import 'package:guide_me/features/booking/data/models/add_booking_request.dart';
import 'package:guide_me/features/booking/data/models/cancel_booking_response.dart';
import 'package:guide_me/features/booking/domain/entities/booking_entity.dart';
import 'package:guide_me/features/booking/domain/repos/booking_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: BookingRepo)
class BookingRepoImpl implements BookingRepo {
  final BookingRemoteDataSource _remoteDataSource;

  const BookingRepoImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, BookingEntity>> addBooking({
    required AddBookingRequest addBookingRequest,
  }) async {
    try {
      final response = await _remoteDataSource.addBooking(
        addBookingRequest: addBookingRequest,
      );
      return right(BookingMapper.toEntity(response));
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, CancelBookingResponse>> cancelBooking({
    required String bookingId,
  }) async {
    try {
      final response = await _remoteDataSource.cancelBooking(
        bookingId: bookingId,
      );
      return right(response);
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }
}
