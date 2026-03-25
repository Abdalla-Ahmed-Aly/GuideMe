import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/shared/entities/location_entity.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/widgets/view_location_on_map.dart';
import 'package:guide_me/features/dashboard/presentation/widgets/booking_request_screen_widgets/meeting_point_header.dart';

class MeetingPointSection extends StatelessWidget {
  const MeetingPointSection({
    super.key,
    required this.location,
  });
  final LocationEntity location;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: const Color(0xffFFE5BA)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          MeetingPointHeader(location: location),

          const SizedBox(height: 12),

          Container(
            height: 150.h,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: const Color(0xffFFE5BA),
                strokeAlign: BorderSide.strokeAlignOutside,
              ),
            ),
            child: location.lat != null && location.lng != null
                ? ViewLocationOnMap(
                    lat: location.lat!,
                    lng: location.lng!,
                  )
                : Center(child: Text(context.l10n.unknownLocation)),
          ),
        ],
      ),
    );
  }
}
