import 'package:flutter/material.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/arrow_back_button.dart';

class CompletedTripDetailesSection extends StatelessWidget {
  const CompletedTripDetailesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 23),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(width: 40, child: ArrowBackButton()),
                ),
              ),
              Center(
                child: Text(
                  context.l10n.analysis,
                  style: AppTextStyles.poppinsBold24.copyWith(
                    color: AppColors.black,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 34,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.p),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.l10n.theTourwaswith,
                      style: AppTextStyles.poppinsBold28.copyWith(
                        color: const Color(0xffF2930D),
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Adam Ahmed',
                      style: AppTextStyles.poppinsBold32.copyWith(
                        color: const Color(0xffF2930D),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      color: Color(0xffF2930D), //
                      shape: BoxShape.circle,
                    ),
                    child: Container(
                      width: 88,
                      height: 88,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(
                            AppImages.profileImageTest,
                          ), // مسار صورتك
                          fit: BoxFit.cover, 
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
