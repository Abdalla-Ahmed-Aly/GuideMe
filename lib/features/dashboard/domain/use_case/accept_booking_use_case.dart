import 'package:dartz/dartz.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/features/dashboard/domain/repo/dashboard_socket_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class AcceptBookingUseCase {
  final DashboardSocketRepository repository;

  AcceptBookingUseCase(this.repository);

  Future<Either<Failure, Unit>> call(String bookingId) {
    return repository.acceptBooking(bookingId);
  }
}
