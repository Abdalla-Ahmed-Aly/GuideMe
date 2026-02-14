import 'package:flutter/material.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class EstimatedEarningsSection extends StatelessWidget {
  const EstimatedEarningsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 346.w,
      height: 83.h,
      decoration: BoxDecoration(
        color: const Color(0xffFFE5BA).withValues(alpha: .20),
        border: Border.all(color: const Color(0xffFFE5BA)),

        borderRadius: BorderRadius.circular(50),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 28, top: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Estimated Earnings ',
              style: AppTextStyles.poppinsRegular14.copyWith(
                color: const Color(0xff7C6965),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text(
                  '1,200 EGP',
                  style: AppTextStyles.poppinsSemiBold20,
                ),
                SizedBox(
                  width: 150.w,
                ),
                Image.asset(AppImages.money),
              ],
            ),
            // Image.asset(AppImages.money),
          ],
        ),
      ),
    );
  }
}
