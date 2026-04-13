
import 'package:dartz/dartz.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/features/dashboard/domain/entities/request_entity.dart';
import 'package:guide_me/features/dashboard/domain/repo/dashboard_socket_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class ListenToIncomingRequestsUseCase {
  final DashboardSocketRepository repository;
  ListenToIncomingRequestsUseCase(this.repository);
  Stream<Either<Failure, RequestEntity>> call() {
    return repository.listenToIncomingRequests();
  }
  
}