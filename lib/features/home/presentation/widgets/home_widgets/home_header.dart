import 'package:flutter/material.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.p),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            AppImages.homeHeader,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: size.height * 0.07),

          // Explore World Text
          Padding(
            padding: EdgeInsets.only(right: 100.p),
            child: Text(
              context.l10n.exploreWorld,
              style: AppTextStyles.poppinsBold36.copyWith(
                color: Colors.white,
              ),
            ),
          ),

          const SizedBox(height: 12),

          // Discover Text
          Text.rich(
            TextSpan(
              text: "${context.l10n.discover} - ",
              style: TextStyle(
                fontFamily: AppTextStyles.familyPoppins,
                fontSize: 12.fs,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
              children: [
                TextSpan(
                  text: context.l10n.takeYourTravelToNextLevel,
                  style: TextStyle(
                    fontFamily: AppTextStyles.familyPoppins,
                    fontSize: 12.fs,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Search Widget
          // CustomTextField(
          //   hintText: context.l10n.searchDestination,
          //   suffixIcon: Icon(
          //     Icons.search,
          //     color: AppColors.natural3,
          //     size: 22.ic,
          //   ),
          // ),

          SizedBox(height: size.height * 0.10),
        ],
      ),
    );
  }
}
