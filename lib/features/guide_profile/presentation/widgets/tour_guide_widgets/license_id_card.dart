import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guide_me/core/app_assets/app_icons.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class LicenseIdCard extends StatelessWidget {
  const LicenseIdCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xffF2930D).withValues(alpha: .1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: SvgPicture.asset(
            AppIcons.licenseId,
            width: 24,
            height: 24,
            colorFilter: const ColorFilter.mode(
              Color(0xffF2930D),
              BlendMode.srcIn,
            ),
          ),
        ),

        const SizedBox(width: 12),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.l10n.licenseId,
              style: AppTextStyles.interRegular14.copyWith(
                color: const Color(0xff64748B),
              ),
            ),
            const SizedBox(height: 2),
            Text(
              "#EGY-7742-GUIDE",
              style: AppTextStyles.interMedium16,
            ),
          ],
        ),
      ],
    );
  }
}
