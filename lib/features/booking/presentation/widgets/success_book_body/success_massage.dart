import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/app_button.dart';

class SuccessMassage extends StatefulWidget {
  const SuccessMassage({super.key});

  @override
  State<SuccessMassage> createState() => _SuccessMassageState();
}

class _SuccessMassageState extends State<SuccessMassage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 21.p, bottom: 16.p),
            child: Image.asset(
              AppImages.success,
            ),
          ),
          Text(
            context.l10n.success2,
            style: AppTextStyles.interMedium24.copyWith(
              color: AppColors.primary,
              decoration: TextDecoration.none,
            ),
          ),
          SizedBox(
            height: size.height * 0.03625,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.p),
            child: AppButton(
              onPressed: () {
                context.push(AppRoutes.bookTourScreen);
              },
              text: context.l10n.confirm1,
            ),
          ),

          SizedBox(
            height: 36.h,
          ),
        ],
      ),
    );
  }
}
