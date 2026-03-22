import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:guide_me/core/constants/maps_constants.dart';
import 'package:guide_me/core/location_core/presentation/cubits/pick_location_cubit/pick_location_cubit.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:latlong2/latlong.dart';

class MapBlocBuilder extends StatefulWidget {
  const MapBlocBuilder({
    super.key,
  });

  @override
  State<MapBlocBuilder> createState() => _MapBlocBuilderState();
}

class _MapBlocBuilderState extends State<MapBlocBuilder> {
  final MapController _mapController = MapController();

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PickLocationCubit, PickLocationState>(
      listener: (context, state) {
        if (state is PickLocationSuccess && state.movedByGps) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _mapController.move(
              LatLng(state.location.lat, state.location.lng),
              15,
            );
          });
        }
      },
      builder: (context, state) {
        return FlutterMap(
          mapController: _mapController,
          options: MapOptions(
            initialCenter: const LatLng(29.9792345, 31.134202),
            initialZoom: 12,
            onTap: (_, point) {
              context.read<PickLocationCubit>().pickLocation(
                lat: point.latitude,
                lng: point.longitude,
              );
            },
          ),
          children: [
            TileLayer(
              urlTemplate: MapsConstants.mapUrlTemplate,
              userAgentPackageName: MapsConstants.userAgentPackageName,
            ),

            MarkerLayer(
              markers: [
                if (state is PickLocationSuccess ||
                    state is PickLocationSuccessLoading)
                  Marker(
                    alignment: Alignment.topCenter,
                    point: LatLng(
                      (state as dynamic).location.lat,
                      (state as dynamic).location.lng,
                    ),
                    child: const Icon(
                      Icons.location_pin,
                      color: AppColors.primary2,
                      size: 38,
                    ),
                  ),
              ],
            ),
          ],
        );
      },
    );
  }
}
