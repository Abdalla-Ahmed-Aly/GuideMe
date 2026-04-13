
import 'package:guide_me/features/dashboard/data/models/data_response_model.dart';

class AnalysisResponse {
  bool success;
  Data data;

  AnalysisResponse({required this.success, required this.data});

  factory AnalysisResponse.fromJson(Map<String, dynamic> json) {
    return AnalysisResponse(
      success: json['success'],
      data: Data.fromJson(json['data']),
    );
  }
}