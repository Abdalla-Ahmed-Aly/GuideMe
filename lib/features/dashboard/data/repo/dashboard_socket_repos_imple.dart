import 'package:dartz/dartz.dart';
import 'package:guide_me/core/errors/error_handler.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/core/socket/socket_app_events.dart';
import 'package:guide_me/core/socket/socket_event_bus.dart';
import 'package:guide_me/features/dashboard/data/data_source/dashboard_remote_data_source.dart';
import 'package:guide_me/features/dashboard/data/mappers/request_card_mapper.dart';
import 'package:guide_me/features/dashboard/data/models/Analysis_model/request_guide_model/request_model%20.dart';
import 'package:guide_me/features/dashboard/domain/entities/request_entity.dart';
import 'package:guide_me/features/dashboard/domain/repo/dashboard_socket_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: DashboardSocketRepository)
class DashboardSocketRepositoryImpl extends DashboardSocketRepository {
  final DashboardRemoteDataSource remoteDataSource;
  final SocketEventBus socketEventBus;

  DashboardSocketRepositoryImpl(this.remoteDataSource, this.socketEventBus);

  @override
  Future<Either<Failure, List<RequestCardEntity>>> getRequestsGuide() async {
    try {
      final result = await remoteDataSource.getRequestsHistory();
      final entities = result.expand((request) {
  if (request.type == "package") {
    return request.bookings!
        .map((b) => RequestCardMapper.toEntity(b));
  } else {
    return [
      RequestCardMapper.toEntity(request.booking!)
    ];
  }
}).toList();
      return Right(entities);
    } catch (e) {
      print("🔥 ERROR TYPE: ${e.runtimeType}");
  print("🔥 ERROR: $e");
      return left(ErrorHandler.handle(e));
    }
  }

  @override
Stream<Either<Failure, RequestCardEntity>> listenToIncomingRequests() {
  return socketEventBus
      .listenTo(SocketAppEvents.newBooking.name)
      .cast<Map<String, dynamic>>()
      .map((data) {
    try {
      final model = RequestModel.fromJson(data);

      final entity =
          RequestCardMapper.toEntity(model.booking!); // 👈 أهم سطر

      return Right(entity);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  });
}

  @override
  Future<Either<Failure, RequestCardEntity>> getRequestById(String bookingId) {
    // TODO: implement getRequestById
    throw UnimplementedError();
  }
  
  // @override
  // void closeConnection() {
  //   // TODO: implement closeConnection
  // }
}
