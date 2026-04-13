import 'package:dartz/dartz.dart';
import 'package:guide_me/core/constants/api_constants.dart';
import 'package:guide_me/core/errors/error_handler.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/core/network/api_service.dart';
import 'package:guide_me/features/dashboard/data/models/toggle_status_model%20.dart';
import 'package:guide_me/features/dashboard/domain/repo/toggle_online_repository%20.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ToggleOnlineRepository)
class ToggleOnlineRepositoryImpl implements ToggleOnlineRepository {
  final ApiService apiService;

  ToggleOnlineRepositoryImpl({required this.apiService});
  

  @override
  Future<Either<Failure, ToggleStatusModel>> toggleOnline(bool isOnline) async {
    
    try {
  final response = await apiService.patch(
    endpoint: ApiConstants.toggleOnlineStatusEndpoint,
    data: {'isOnline': isOnline},
  );
  return Right(ToggleStatusModel.fromJson(response.data));
}  catch (e) {
  return left(ErrorHandler.handle(e));
}
  }

}
