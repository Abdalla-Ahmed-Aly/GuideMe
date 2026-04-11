import 'package:dartz/dartz.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/features/dashboard/domain/entities/request_entity.dart';

abstract class DashboardSocketRepository {
  Future<Either<Failure, List<RequestCardEntity>>> getRequestsGuide();
  Stream<Either<Failure, RequestCardEntity>> listenToIncomingRequests();

}
