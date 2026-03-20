import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:guide_me/core/constants/maps_constants.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:latlong2/latlong.dart';

class ViewLocationOnMap extends StatelessWidget {
  const ViewLocationOnMap({super.key, required this.lat, required this.lng});
  final double lat;
  final double lng;

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        initialCenter: LatLng(lat, lng),
        initialZoom: 12,
      ),
      children: [
        TileLayer(
          urlTemplate: MapsConstants.mapUrlTemplate,
          userAgentPackageName: MapsConstants.userAgentPackageName,
        ),

        MarkerLayer(
          markers: [
            Marker(
              point: LatLng(lat, lng),
              child: const Icon(
                Icons.location_on,
                color: AppColors.primary2,
                size: 44,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
