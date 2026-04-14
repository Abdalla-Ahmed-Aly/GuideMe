import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/shared/entities/user_entity.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/guide_profile/presentation/widgets/tour_guide_widgets/license_id_card.dart';

class ProfessionalDetailsSection extends StatelessWidget {
  const ProfessionalDetailsSection({super.key, required this.user});
  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.p, vertical: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xffF2930D).withValues(alpha: .05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xffF2930D).withValues(alpha: .1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.professionalDetails,
            style: AppTextStyles.interBold16.copyWith(
              color: const Color(0xffF2930D),
            ),
          ),

          const SizedBox(height: 16),

          LicenseIdCard(user: user),
        ],
      ),
    );
  }
}
