import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/app_button.dart';

class AllowLocationAccessScreen extends StatelessWidget {
  const AllowLocationAccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          211.verticalSpace,

          // Location Icon
          Container(
            padding: EdgeInsets.symmetric(vertical: 28.h, horizontal: 30.w),
            decoration: BoxDecoration(
              color: const Color(0xff747480).withValues(alpha: .18),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                Icons.location_on_rounded,
                color: AppColors.primary,
                size: 45.ic,
              ),
            ),
          ),

          32.verticalSpace,

          // Texts
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 75.p),
            child: Text(
              context.l10n.enablePreciseLocation,
              textAlign: TextAlign.center,
              style: AppTextStyles.poppinsBold30.copyWith(
                color: AppColors.primary500,
              ),
            ),
          ),

          16.verticalSpace,

          // Texts
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 75.p),
            child: Text(
              context.l10n.locationDescription,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.fs,
                color: AppColors.natural1,
                fontFamily: AppTextStyles.familyInter,
              ),
            ),
          ),

          37.verticalSpace,

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.p),
            child: AppButton(
              onPressed: () {
                context.go(AppRoutes.chooseRoleScreen);
              },
              text: context.l10n.enable,
            ),
          ),

          34.verticalSpace,

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 104.p),
            child: Text(
              context.l10n.securityNote,
              textAlign: TextAlign.center,
              style: AppTextStyles.interRegular12.copyWith(
                color: AppColors.natural1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
