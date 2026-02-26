import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guide_me/core/app_assets/app_icons.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class DocumentIssueTile extends StatelessWidget {
  const DocumentIssueTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xffFEF4E6),
            borderRadius: BorderRadius.circular(5),
          ),
          child: SvgPicture.asset(
            AppIcons.file,
            colorFilter: const ColorFilter.mode(
              Color(0xffFF9900),
              BlendMode.srcIn,
            ),
          ),
        ),

        const SizedBox(width: 14),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.l10n.tourGuideLicense,
                style: AppTextStyles.poppinsSemiBold18,
              ),
              const SizedBox(height: 2),
              Text(
                context.l10n.imageTooBlurry,
                style: AppTextStyles.poppinsSemiBold14.copyWith(
                  color: const Color(0xffF2930D),
                ),
              ),
            ],
          ),
        ),

        const Icon(
          Icons.error,
          color: Colors.red,
        ),
      ],
    );
  }
}
