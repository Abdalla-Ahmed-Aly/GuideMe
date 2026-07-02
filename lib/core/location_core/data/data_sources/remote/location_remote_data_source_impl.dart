import 'package:guide_me/core/location_core/data/data_sources/remote/location_remote_data_source.dart';
import 'package:guide_me/core/location_core/domain/entites/map_location_entity.dart';
import 'package:guide_me/core/network/api_service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: LocationRemoteDataSource)
class LocationRemoteDataSourceImpl implements LocationRemoteDataSource {
  final ApiService _apiService;

  LocationRemoteDataSourceImpl(this._apiService);

  @override
  Future<String> getPlaceName(double lat, double lng) async {
    final url =
        'https://nominatim.openstreetmap.org/reverse?lat=$lat&lon=$lng&format=json';

    final response = await _apiService.get(
      endpoint: url,
      headers: {
        'User-Agent': 'guide_me_app',
      },
    );

    return response.data['display_name'] ?? 'Unknown Location';
  }

  @override
  Future<List<MapLocationEntity>> searchLocation(String query) async {
    final url =
        'https://nominatim.openstreetmap.org/search?q=${Uri.encodeComponent(query)}&format=json&limit=10';

    final response = await _apiService.get(
      endpoint: url,
      headers: {
        'User-Agent': 'guide_me_app',
      },
    );

    final data = response.data as List;
    return data.map((item) {
      return MapLocationEntity(
        lat: double.tryParse(item['lat']?.toString() ?? '') ?? 0.0,
        lng: double.tryParse(item['lon']?.toString() ?? '') ?? 0.0,
        name: item['display_name'] as String?,
      );
    }).toList();
  }
}
