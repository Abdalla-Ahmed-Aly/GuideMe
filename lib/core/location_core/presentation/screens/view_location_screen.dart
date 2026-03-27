import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/constants/maps_constants.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/shared/entities/location_entity.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:latlong2/latlong.dart';

class ViewLocationScreen extends StatelessWidget {
  const ViewLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).extra as LocationEntity;
    return Scaffold(
      body: Stack(
        children: [
          // Map
          FlutterMap(
            options: MapOptions(
              initialCenter: LatLng(location.lat!, location.lng!),
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
                    point: LatLng(location.lat!, location.lng!),
                    child: const Icon(
                      Icons.location_pin,
                      color: AppColors.primary2,
                      size: 44,
                    ),
                  ),
                ],
              ),
            ],
          ),

          // Custom App Bar
          Positioned(
            top: 50,
            left: context.isEnglish ? 20 : null,
            right: context.isArabic ? 20 : null,
            child: _buildArrowBackButton(context),
          ),

          // Location Info
          Positioned(
            bottom: MediaQuery.of(context).padding.bottom + 16,
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  // icon
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.primary2.withValues(alpha: .1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.location_on,
                      color: AppColors.primary2,
                    ),
                  ),

                  const SizedBox(width: 16),

                  // text
                  Expanded(
                    child: Text(
                      location.name ?? "Uknown",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.poppinsSemiBold16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildArrowBackButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        right: context.isEnglish ? 4 : 0,
        left: context.isEnglish ? 0 : 4,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () {
          context.pop();
        },
      ),
    );
  }
}
