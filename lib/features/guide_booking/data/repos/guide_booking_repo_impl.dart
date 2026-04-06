import 'package:dartz/dartz.dart';
import 'package:guide_me/core/errors/error_handler.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/features/booking/data/mappers/booking_mapper.dart';
import 'package:guide_me/features/booking/domain/entities/booking_entity.dart';
import 'package:guide_me/features/guide_booking/data/data_sources/remote/guide_booking_remote_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:guide_me/features/guide_booking/domain/repos/guide_booking_repo.dart';

@LazySingleton(as: GuideBookingRepo)
class GuideBookingRepoImpl implements GuideBookingRepo {
  final GuideBookingRemoteDataSource _guideBookingRemoteDataSource;
  GuideBookingRepoImpl(this._guideBookingRemoteDataSource);

  @override
  Future<Either<Failure, List<BookingEntity>>> getGuideBooking({
    required String? date,
  }) async {
    try {
      final reponse = await _guideBookingRemoteDataSource.getGuideBooking(
        date: date,
      );

      return right(reponse.map((e) => BookingMapper.toEntity(e)).toList());
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, void>> endTour({required String bookingId}) async {
    try {
      final response = await _guideBookingRemoteDataSource.endTour(
        bookingId: bookingId,
      );
      return right(response);
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, void>> startTour({required String bookingId}) async {
    try {
      final response = await _guideBookingRemoteDataSource.startTour(
        bookingId: bookingId,
      );
      return right(response);
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }
}
