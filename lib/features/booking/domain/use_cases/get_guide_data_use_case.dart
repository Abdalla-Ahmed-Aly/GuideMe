import 'package:dartz/dartz.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/features/booking/domain/entities/guider_entities/guide_details_entity.dart';
import 'package:guide_me/features/booking/domain/repos/booking_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GetGuideDataUseCase {
  final BookingRepo _bookingRepo;

  GetGuideDataUseCase(this._bookingRepo);

  Future<Either<Failure, GuideDetailsEntity>> call({required String guideId}) async {
    return await _bookingRepo.getGuideData(guideId: guideId);
  }
}
