import 'package:guide_me/core/constants/api_constants.dart';
import 'package:guide_me/core/network/api_service.dart';
import 'package:guide_me/features/dashboard/data/models/Analysis_model/request_guide_model/request_model%20.dart';
import 'package:injectable/injectable.dart';

abstract class DashboardRemoteDataSource {
  Future<List<RequestModel>> getRequestsHistory();
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
}
