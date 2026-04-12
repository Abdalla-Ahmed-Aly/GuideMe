import 'package:guide_me/core/constants/api_constants.dart';
import 'package:guide_me/core/network/api_service.dart';
import 'package:guide_me/features/dashboard/data/models/Analysis_model/analysis_response_model.dart';
import 'package:injectable/injectable.dart';

abstract class AnalysisRemoteDataSource {
  Future<AnalysisResponse> getAnalysis();
}

@LazySingleton(as: AnalysisRemoteDataSource)
class AnalysisRemoteDataSourceImple extends AnalysisRemoteDataSource {
  final ApiService apiService;

  AnalysisRemoteDataSourceImple(this.apiService);

  @override
  Future<AnalysisResponse> getAnalysis() async {
    final response = await apiService.get(
      endpoint: ApiConstants.analysisEndpoint,
      
    );
    return AnalysisResponse.fromJson(response.data);
    

  }
}
