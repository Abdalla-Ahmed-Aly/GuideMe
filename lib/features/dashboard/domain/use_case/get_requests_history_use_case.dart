import 'package:dartz/dartz.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/features/dashboard/domain/entities/request_entity.dart';
import 'package:guide_me/features/dashboard/domain/repo/dashboard_socket_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetRequestsHistoryUseCase {
  final DashboardSocketRepository repository;

  GetRequestsHistoryUseCase(this.repository);
  Future<Either<Failure, List<RequestEntity>>> call() {
    return repository.getRequestsGuide();
  }
}
