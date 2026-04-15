import 'package:dartz/dartz.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/features/dashboard/domain/entities/request_entity.dart';

abstract class DashboardSocketRepository {
  Future<Either<Failure, List<RequestEntity>>> getRequestsGuide();
  Future<Either<Failure, Unit>> acceptBooking(String bookingId);
  Future<Either<Failure, Unit>> declineBooking(String bookingId);
  Future<Either<Failure, void>> acceptPackageBooking(String packageId);
}
