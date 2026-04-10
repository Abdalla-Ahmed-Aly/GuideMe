import 'package:dartz/dartz.dart';
import 'package:guide_me/core/errors/error_handler.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/core/socket/socket_app_events.dart';
import 'package:guide_me/core/socket/socket_event_bus.dart';
import 'package:guide_me/features/dashboard/data/data_source/dashboard_remote_data_source.dart';
import 'package:guide_me/features/dashboard/data/models/Analysis_model/request_guide_model/request_model%20.dart';
import 'package:guide_me/features/dashboard/domain/repo/dashboard_socket_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: DashboardSocketRepository)
class DashboardSocketRepositoryImpl extends DashboardSocketRepository {
  final DashboardRemoteDataSource remoteDataSource;
  final SocketEventBus socketEventBus;

  DashboardSocketRepositoryImpl(this.remoteDataSource, this.socketEventBus);

  @override
  Future<Either<Failure, List<RequestModel>>> getRequestsGuide() async {
    try {
      final result = await remoteDataSource.getRequestsHistory();
      return Right(result);
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }

  @override
  Stream<Either<Failure, RequestModel>> listenToIncomingRequests() {
    return socketEventBus
        .listenTo(SocketAppEvents.newBooking.name).cast<Map<String, dynamic>>()
        .map<Either<Failure, RequestModel>>((data) {
          try {
            final request = RequestModel.fromJson(data);
            return Right(request);
          } catch (e) {
            return Left(ErrorHandler.handle(e));
          }
        });
  }
  
  // @override
  // void closeConnection() {
  //   // TODO: implement closeConnection
  // }
}
