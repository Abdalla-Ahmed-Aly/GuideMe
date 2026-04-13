
import 'package:dartz/dartz.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/features/dashboard/data/models/toggle_status_model%20.dart';

abstract class ToggleOnlineRepository {
  Future<Either<Failure, ToggleStatusModel>> toggleOnline(bool isOnline);
}