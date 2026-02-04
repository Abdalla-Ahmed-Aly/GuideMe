import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guide_me/core/app_assets/app_icons.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class ProfileOfTourGuide extends StatelessWidget {
  const ProfileOfTourGuide({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 150.w, 
          height: 100.w,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFE6ECEE),
          ),
        ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 10.p),
              child: Text(
                'John Doe',
                style: AppTextStyles.poppinsSemiBold18.copyWith(
                  color: AppColors.black,
                ),
              ),
            ),
            Text(
              context.l10n.mars,
              style: AppTextStyles.poppinsRegular12.copyWith(
                color: AppColors.natural1,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.p),
              child: SvgPicture.asset(AppIcons.rating),
            ),
          ],
        ),
      ],
    );
  }
}
