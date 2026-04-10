
import 'package:dartz/dartz.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/features/dashboard/data/models/Analysis_model/request_guide_model/request_model%20.dart';
import 'package:guide_me/features/dashboard/domain/repo/dashboard_socket_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class ListenToIncomingRequestsUseCase {
  final DashboardSocketRepository repository;
  ListenToIncomingRequestsUseCase(this.repository);
  Stream<Either<Failure, RequestModel>> call() {
    return repository.listenToIncomingRequests();
  }
  
}