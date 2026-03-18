import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class PickMeetingPointLocationTile extends StatelessWidget {
  const PickMeetingPointLocationTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xffF1F5F9)),
      ),
      child: Row(
        children: [
          _buildLocationIcon(),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.meetingPoint,
                  style: AppTextStyles.poppinsMedium14.copyWith(
                    color: const Color(0xff94A3B8),
                  ),
                ),

                Text(
                  context.l10n.chooseYourMeetingPoint,
                  style: AppTextStyles.poppinsSemiBold16,
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          const Icon(
            Icons.arrow_forward_ios_rounded,
            color: AppColors.primary2,
            size: 20,
          ),
        ],
      ),
    );
  }

  Container _buildLocationIcon() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.primary2.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Icon(
        Icons.location_on_rounded,
        color: AppColors.primary2,
      ),
    );
  }
}
