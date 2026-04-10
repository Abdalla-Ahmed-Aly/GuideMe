import 'package:dartz/dartz.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/features/dashboard/data/models/Analysis_model/request_guide_model/request_model%20.dart';

abstract class DashboardSocketRepository {
  Future<Either<Failure, List<RequestModel>>> getRequestsGuide();
  Stream<Either<Failure, RequestModel>> listenToIncomingRequests();

}
