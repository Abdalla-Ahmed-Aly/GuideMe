import 'package:guide_me/core/network/api_service.dart';
import 'package:guide_me/core/constants/api_constants.dart';
import 'package:guide_me/core/shared/models/city_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class GuideRegistrationDataSource {
  final ApiService _apiService;

  GuideRegistrationDataSource(this._apiService);

  Future<List<CityModel>> getAllCities() async {
    try {
      final response = await _apiService.get(endpoint: ApiConstants.citiesEndpoint);
      final dynamic responseData = response.data;
      
      List<dynamic>? citiesJson;
      if (responseData is Map) {
        if (responseData['data'] is List) {
          citiesJson = responseData['data'];
        } else if (responseData['data'] is Map && responseData['data']['cities'] is List) {
          citiesJson = responseData['data']['cities'];
        } else if (responseData['cities'] is List) {
          citiesJson = responseData['cities'];
        }
      }

      if (citiesJson == null) {
        throw Exception('Invalid cities response format: $responseData');
      }

      return citiesJson.map((e) => CityModel.fromJson(e)).toList();
    } catch (e) {
      print("ERROR_FETCHING_CITIES: $e");
      rethrow;
    }
  }
}
