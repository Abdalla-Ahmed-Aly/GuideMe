import 'package:latlong2/latlong.dart';

abstract class GpsLocalDataSource {
  Future<LatLng> getCurrentLocation();
}