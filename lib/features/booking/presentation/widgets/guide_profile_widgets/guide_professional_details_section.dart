import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guide_me/core/app_assets/app_icons.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/shared/entities/user_entity.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/booking/presentation/widgets/guide_profile_widgets/guide_spoken_language_section.dart';

class GuideProfessionalDetailsSection extends StatelessWidget {
  const GuideProfessionalDetailsSection({
    super.key,
    required this.guide,
  });

  final UserEntity guide;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.professionalDetails,
          style: AppTextStyles.interSemiBold20,
        ),

        const SizedBox(height: 16),

        _BuildLicenseIdTile(guide: guide),

        const SizedBox(height: 16),

        GuideSpokenLanguagesSection(guide: guide),
      ],
    );
  }
}

class _BuildLicenseIdTile extends StatelessWidget {
  const _BuildLicenseIdTile({required this.guide});

  final UserEntity guide;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          AppIcons.licenseId,
          width: 24,
          height: 24,
          colorFilter: const ColorFilter.mode(
            AppColors.primary2,
            BlendMode.srcIn,
          ),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '${context.l10n.licenseIdText}: ',
                  style: AppTextStyles.interRegular18.copyWith(
                    color: const Color(0xffB59A64),
                  ),
                ),
                TextSpan(
                  text: guide.id,
                  style: AppTextStyles.interRegular18.copyWith(
                    color: const Color(0xffB59A64),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
