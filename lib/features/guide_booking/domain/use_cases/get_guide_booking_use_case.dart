import 'package:dartz/dartz.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/features/booking/domain/entities/booking_entity.dart';
import 'package:guide_me/features/guide_booking/domain/repos/guide_booking_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

@lazySingleton
class GetGuideBookingUseCase {
  final GuideBookingRepo _guideBookingRepo;
  GetGuideBookingUseCase(this._guideBookingRepo);

  Future<Either<Failure, List<BookingEntity>>> call({
    required String? status,
    required DateTime? date,
  }) async {
    final formattedDate = date != null
        ? DateFormat("yyyy-MM-dd").format(date)
        : null;
    return await _guideBookingRepo.getGuideBooking(
      date: formattedDate,
    );
  }
}
