import 'package:dartz/dartz.dart';
import 'package:guide_me/core/errors/error_handler.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/core/socket/socket_app_events.dart';
import 'package:guide_me/core/socket/socket_event_bus.dart';
import 'package:guide_me/features/dashboard/data/data_source/dashboard_remote_data_source.dart';
import 'package:guide_me/features/dashboard/data/mappers/request_mapper.dart';
import 'package:guide_me/features/dashboard/data/models/request_model.dart';
import 'package:guide_me/features/dashboard/domain/entities/request_entity.dart';
import 'package:guide_me/features/dashboard/domain/repo/dashboard_socket_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: DashboardSocketRepository)
class DashboardSocketRepositoryImpl extends DashboardSocketRepository {
  final DashboardRemoteDataSource remoteDataSource;
  final SocketEventBus socketEventBus;

  DashboardSocketRepositoryImpl(this.remoteDataSource, this.socketEventBus);

  @override
  Future<Either<Failure, List<RequestEntity>>> getRequestsGuide() async {
    try {
      final result = await remoteDataSource.getRequestsHistory();
      final entities = result.map((e) => RequestMapper.toEntity(e)).toList();
      return Right(entities);
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }

  @override
  Stream<Either<Failure, RequestEntity>> listenToIncomingRequests() {
    return socketEventBus
        .listenTo(SocketAppEvents.newBooking.name)
        .cast<Map<String, dynamic>>()
        .map((data) {
          try {
            final model = RequestModel.fromJson(data);

            final entity = RequestMapper.toEntity(
              model,
            );

            return Right(entity);
          } catch (e) {
            return Left(ErrorHandler.handle(e));
          }
        });
  }

  @override
  Future<Either<Failure, Unit>> acceptBooking(String bookingId) async {
    try {
      await remoteDataSource.acceptBooking(bookingId);
      return const Right(unit);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> declineBooking(String bookingId) async {
    try {
      await remoteDataSource.declineBooking(bookingId);
      return const Right(unit);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, void>> acceptPackageBooking(String packageId) async {
    try {
      await remoteDataSource.acceptPackageBooking(packageId);
      return const Right(null);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }
}
