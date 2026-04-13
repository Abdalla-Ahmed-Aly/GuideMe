import 'package:dartz/dartz.dart';
import 'package:guide_me/core/constants/api_constants.dart';
import 'package:guide_me/core/network/api_service.dart';
import 'package:guide_me/features/dashboard/data/models/request_model.dart';
import 'package:injectable/injectable.dart';

abstract class DashboardRemoteDataSource {
  Future<List<RequestModel>> getRequestsHistory();
  Future<Unit> acceptBooking(String bookingId);
  Future<Unit> declineBooking(String bookingId);
  Future<void> acceptPackageBooking(String packageId);
}

@LazySingleton(as: DashboardRemoteDataSource)
class DashboardRemoteDataSourceImpl implements DashboardRemoteDataSource {
  final ApiService apiService;
  DashboardRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<RequestModel>> getRequestsHistory() async {
    final response = await apiService.get(
      endpoint: ApiConstants.getRequestsHistoryEndpoint,
    );
    final List requestsJson = response.data['data']['requests'];
    return requestsJson.map((json) => RequestModel.fromJson(json)).toList();
  }

  @override
  Future<Unit> acceptBooking(String bookingId) async {
    await apiService.patch(
      endpoint: "${ApiConstants.acceptBookingEndpoint}/$bookingId/accept",
    );
    return unit;
  }

  @override
  Future<Unit> declineBooking(String bookingId) async {
    await apiService.patch(
      endpoint: "${ApiConstants.acceptBookingEndpoint}/$bookingId/decline",
    );
    return unit;
  }

  @override
  Future<void> acceptPackageBooking(String packageId) async {
    await apiService.patch(
      endpoint:
          "${ApiConstants.guidePackageBooking}/$packageId${ApiConstants.acceptBooking}",
    );
  }
}
