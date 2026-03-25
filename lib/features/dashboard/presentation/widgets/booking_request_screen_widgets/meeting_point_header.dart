import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/shared/entities/location_entity.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class MeetingPointHeader extends StatelessWidget {
  const MeetingPointHeader({super.key, required this.location});
  final LocationEntity location;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xffFEF4E6),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Icon(
            Icons.people,
            color: AppColors.primary2,
          ),
        ),

        const SizedBox(width: 8),
        
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.l10n.mettingpoint,
                style: AppTextStyles.poppinsRegular16.copyWith(
                  color: const Color(0xffA2A9B5),
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                location.name ?? "",
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.poppinsMedium16,
              ),
            ],
          ),
        ),
        
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xffFEF4E6),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            context.l10n.directions,
            style: AppTextStyles.poppinsMedium14.copyWith(
              color: const Color(0xffF2930D),
            ),
          ),
        ),
      ],
    );
  }
}
