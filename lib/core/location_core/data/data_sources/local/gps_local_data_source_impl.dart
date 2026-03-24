import 'package:geolocator/geolocator.dart';
import 'package:guide_me/core/location_core/data/data_sources/local/gps_local_data_source.dart';
import 'package:guide_me/core/location_core/data/utils/location_permission_handler.dart';
import 'package:injectable/injectable.dart';
import 'package:latlong2/latlong.dart';

@LazySingleton(as: GpsLocalDataSource)
class GpsLocalDataSourceImpl implements GpsLocalDataSource {
  @override
  Future<LatLng> getCurrentLocation() async {
    await LocationPermissionHandler.ensurePermissionGranted();
    final position = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
      ),
    );
    return LatLng(position.latitude, position.longitude);
  }
  }