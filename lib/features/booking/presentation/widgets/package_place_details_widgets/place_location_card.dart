import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/view_location_on_map.dart';
import 'package:guide_me/core/shared/entities/place_info_entity.dart';

class PlaceLocationCard extends StatelessWidget {
  const PlaceLocationCard({super.key});

  @override
  Widget build(BuildContext context) {
    final place = GoRouterState.of(context).extra as PlaceInfoEntity;
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Container(
            height: 160.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
            ),
            child: ViewLocationOnMap(
              lat: place.location!.lat!,
              lng: place.location!.lng!,
            ),
          ),

          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: Color(0xffE2E8F0),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    place.location!.name ?? context.l10n.unknownLocation,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.poppinsMedium14.copyWith(
                      color: const Color(0xff475569),
                    ),
                  ),
                ),

                const SizedBox(width: 4),

                GestureDetector(
                  onTap: () {
                    context.push(AppRoutes.viewLocationScreen, extra: place.location);
                  },
                  child: Text(
                    context.l10n.viewOnMaps,
                    style: AppTextStyles.poppinsBold16.copyWith(
                      color: AppColors.primary2,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
