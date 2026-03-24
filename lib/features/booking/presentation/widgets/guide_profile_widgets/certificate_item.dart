import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guide_me/core/app_assets/app_icons.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/shared/entities/certificate_entity.dart';

class CertificateItem extends StatelessWidget {
  const CertificateItem({
    super.key,
    required this.certificate,
  });

  final CertificateEntity certificate;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            AppIcons.diploma,
            width: 24,
            height: 24,
            colorFilter: const ColorFilter.mode(
              AppColors.primary2,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(width: 12),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                certificate.name,
                style: AppTextStyles.interBold16.copyWith(
                  color: AppColors.black,
                ),
              ),

              const SizedBox(height: 6),

              Text(
                certificate.organization,
                style: AppTextStyles.interMedium14.copyWith(
                  color: const Color(0xffB59A64),
                ),
              ),

              const SizedBox(height: 6),

              Text(
                "${context.l10n.validUntil}${certificate.expirationDate}",
                style: AppTextStyles.interMedium14.copyWith(
                  color: AppColors.natural3,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
