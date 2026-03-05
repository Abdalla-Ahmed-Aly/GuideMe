import 'package:flutter/material.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/dashboard/presentation/widgets/booking_request_screen_widgets/booking_request_section.dart';

class BookingRequestScreen extends StatelessWidget {
  const BookingRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const BookingRequestSection(),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 19),
        decoration: const BoxDecoration(color: Colors.white),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 13),
              decoration: BoxDecoration(
                color: const Color(0xffFEF4E6),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(
                AppImages.chat,
                width: 20.w,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  backgroundColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: const BorderSide(
                      color: Color(0xffA3A3A3),
                    ),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  context.l10n.decline,
                  style: AppTextStyles.poppinsMedium14.copyWith(
                    color: AppColors.black,
                  ),
                ),
              ),
            ),

            const SizedBox(width: 16),
            
            Expanded(
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: const BorderSide(
                      color: AppColors.primary,
                    ),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  context.l10n.accept,
                  style: AppTextStyles.poppinsMedium14.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
