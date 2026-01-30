import 'package:flutter/material.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/app_button.dart';

class ChooseRoleScreen extends StatelessWidget {
  const ChooseRoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: size.height * 0.13),

              Text(
                context.l10n.chooseYourRole,
                style: AppTextStyles.poppinsBold38.copyWith(
                  color: AppColors.primary,
                ),
              ),

              SizedBox(height: size.height * 0.05),

              Container(
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  AppImages.chooseRole,
                ),
              ),

              SizedBox(height: size.height * 0.05),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 60.p),
                child: AppButton(
                  onPressed: () {},
                  text: context.l10n.tourist,
                  radius: 40,
                  textStyle: AppTextStyles.interSemiBold24,
                ),
              ),

              // 25.verticalSpace,
              const SizedBox(height: 25),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 60.p),
                child: AppButton(
                  onPressed: () {},
                  text: context.l10n.tourGuide,
                  radius: 40,
                  textStyle: AppTextStyles.interSemiBold24,
                ),
              ),

              // To make the column take the full width and center the widgets
              double.infinity.horizontalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
