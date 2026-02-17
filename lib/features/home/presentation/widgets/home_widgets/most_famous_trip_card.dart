import 'package:flutter/material.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class MostFamousTripCard extends StatefulWidget {
  const MostFamousTripCard({super.key});

  @override
  State<MostFamousTripCard> createState() => _MostFamousTripCardState();
}

class _MostFamousTripCardState extends State<MostFamousTripCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: () {},
      child: Container(
        // width: context.isPortrait ? size.width * 0.87 : size.height * 0.87,
        width: size.width * 0.87,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          image: const DecorationImage(
            image: AssetImage(AppImages.famousTripTest),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            // Favorite Icon
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.5,
                      horizontal: 9.5,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: isFavorite
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 24,
                          )
                        : const Icon(
                            Icons.favorite_border_rounded,
                            color: Colors.black,
                            size: 24,
                          ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 55.h),

            // Main Texts
            Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: context.isLandscape
                    ? size.width * 0.1
                    : size.height * 0.1,
              ),
              child: Text(
                context.l10n.exploreWorld,
                style: AppTextStyles.poppinsBold30.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),

            const SizedBox(height: 8),

            // Sub Texts
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text.rich(
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
            ),

            SizedBox(height: 30.h),

            // Price Button
            Container(
              margin: EdgeInsets.symmetric(horizontal: 44.m),
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: const Color(0xffA2A7AA).withValues(alpha: .48),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Arrow
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xff72716F).withValues(alpha: .38),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),

                  // Price Text
                  Text(
                    "400\$",
                    style: AppTextStyles.poppinsBold20.copyWith(
                      color: AppColors.white,
                    ),
                  ),

                  // Use it to centerized the price
                  const SizedBox(width: 45),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
