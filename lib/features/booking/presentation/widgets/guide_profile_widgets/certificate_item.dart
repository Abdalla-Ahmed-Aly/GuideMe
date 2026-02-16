import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guide_me/core/app_assets/app_icons.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class CertificateItem extends StatelessWidget {
  const CertificateItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            AppIcons.diploma,
            width: 20,
            height: 20,
          ),
          const SizedBox(width: 14),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.l10n.certifiedEgyptologist,
                softWrap: true,
                style: AppTextStyles.interSemiBold16.copyWith(
                  color: AppColors.black,
                ),
              ),

              const SizedBox(height: 6),

              Text(
                context.l10n.egyptian,
                style: AppTextStyles.interSemiBold12.copyWith(
                  color: const Color(0xffB59A64),
                ),
              ),

              const SizedBox(height: 6),

              Text(
                context.l10n.valid,
                style: AppTextStyles.interSemiBold12.copyWith(
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
