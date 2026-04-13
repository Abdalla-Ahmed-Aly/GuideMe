import 'package:dartz/dartz.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/features/dashboard/domain/repo/dashboard_socket_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class AcceptPackageUseCase {
  final DashboardSocketRepository repository;
  AcceptPackageUseCase(this.repository);

  Future<Either<Failure, void>> call(String packageId) async {
    return await repository.acceptPackageBooking(packageId);
  }
}