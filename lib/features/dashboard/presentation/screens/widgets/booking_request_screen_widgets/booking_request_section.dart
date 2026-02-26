import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guide_me/core/app_assets/app_icons.dart';

import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/dashboard/presentation/screens/widgets/booking_request_screen_widgets/booking_details_%20request_section.dart';
import 'package:guide_me/features/dashboard/presentation/screens/widgets/booking_request_screen_widgets/metting_point_section.dart';

class BookingRequestSection extends StatelessWidget {
  const BookingRequestSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 34, right: 74),
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Image.asset(AppImages.arrowback),
                ),
              ),
              Center(
                child: Text(
                  context.l10n.bookingRequest,
                  style: AppTextStyles.poppinsSemiBold20.copyWith(
                    color: AppColors.black,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Center(child: ProfileTouirsts()),
          Center(
            child: Text(
              'Ahmed Ali',
              style: AppTextStyles.poppinsRegular18.copyWith(
                color: AppColors.black,
              ),
            ),
          ),
          const SizedBox(
            height: 51,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 23),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                context.l10n.professionalInformation,
                style: AppTextStyles.poppinsSemiBold20.copyWith(
                  color: AppColors.black,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 23.p),
            child: const BookingDetailsRequestSection(),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 23.p),
            child: const MEETINGPOINTSection(),
          ),
          SizedBox(
            height: 140.h,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 23),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                context.l10n.paymentSummary,
                style: AppTextStyles.poppinsSemiBold20.copyWith(
                  color: AppColors.black,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 23.p),
            child: const EarningsSummaryCard(),
          ),
        ],
      ),
    );
  }
}

class EarningsSummaryCard extends StatelessWidget {
  const EarningsSummaryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xffFFE5BA).withValues(alpha: 0.1),
        border: Border.all(color: const Color(0xffCC914A)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              context.l10n.yourEarnings,
              style: AppTextStyles.poppinsSemiBold18,
            ),
          ),
          Text(
            r'$108.00',
            style: AppTextStyles.poppinsSemiBold26.copyWith(
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileTouirsts extends StatelessWidget {
  const ProfileTouirsts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 130,
          height: 130,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(AppImages.profileImageTest),
              fit: BoxFit.cover,
            ),
          ),
        ),

        Positioned(
          bottom: 1,
          right: 8,
          child: Container(
            width: 42,
            height: 46,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.25),
                  blurRadius: 4,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Image.asset(AppImages.correcting),
          ),
        ),
      ],
    );
    ;
  }
}
