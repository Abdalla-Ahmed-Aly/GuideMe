import 'package:geolocator/geolocator.dart';
import 'package:guide_me/core/errors/exceptions.dart';
import 'package:guide_me/core/location_core/data/data_sources/local/gps_local_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:latlong2/latlong.dart';

@LazySingleton(as: GpsLocalDataSource)
class GpsLocalDataSourceImpl implements GpsLocalDataSource {
  @override
  Future<LatLng> getCurrentLocation() async {
    await _checkLocationPermission();
    final position = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
      ),
    );
    return LatLng(position.latitude, position.longitude);
  }
  Future<bool> _checkLocationPermission() async {
    final bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw const LocationServiceDisabledException();
    }

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.deniedForever) {
      throw LocationPermissionDeniedException();
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw LocationPermissionDeniedException();
      }
    }
    return true;
  }
}