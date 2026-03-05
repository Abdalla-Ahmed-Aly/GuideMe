import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guide_me/core/app_assets/app_icons.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/arrow_back_button.dart';
import 'package:guide_me/features/booking/presentation/strategies/trip_card_strategey/mobile_layout_strategy.dart';
import 'package:guide_me/features/booking/presentation/strategies/trip_card_strategey/tablet_layout_strategy.dart';
import 'package:guide_me/features/booking/presentation/strategies/trip_card_strategey/tour_info_layout_strategy.dart';
import 'package:guide_me/features/booking/presentation/strategies/trip_card_strategey/tour_info_section.dart';
import 'package:guide_me/features/dashboard/presentation/widgets/booking_request_screen_widgets/earnings_summary_card.dart';
import 'package:guide_me/features/dashboard/presentation/widgets/booking_request_screen_widgets/metting_point_section.dart';

class CompletedTripDetailesSection extends StatelessWidget {
  const CompletedTripDetailesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final TourInfoLayoutStrategy strategy = width < 600
        ? MobileLayoutStrategy()
        : TabletLayoutStrategy();
    final cards = [
      CustomTripdetails(
        title: context.l10n.dateTIME,
        value: 'Oct 24, 2026',
        value1: '9:00 AM',
        pathicon: SvgPicture.asset(AppIcons.date, width: 18.w),
      ),
      CustomTripdetails(
        title: context.l10n.duration,
        value: '4 Hours',
        value1: 'Flexible end',
        pathicon: SvgPicture.asset(AppIcons.time, width: 18.w),
      ),
      CustomTripdetails(
        title: context.l10n.experience,
        value: 'Giza Pyramids',
        value1: 'History & Myths',
        pathicon: SvgPicture.asset(AppIcons.location, width: 18.w),
      ),
      CustomTripdetails(
        title: context.l10n.experience,
        value: 'Giza Pyramids',
        value1: 'History & Myths',
        pathicon: SvgPicture.asset(AppIcons.location, width: 18.w),
      ),
    ];
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 23),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(width: 40.w, child: const ArrowBackButton()),
                ),
              ),
              Center(
                child: Text(
                  context.l10n.details,
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
            padding: EdgeInsets.symmetric(horizontal: 24.p),
            child: Row(
              children: [
                Expanded(
                  child: Column(
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
                ),
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    color: Color(0xffF2930D), //
                    shape: BoxShape.circle,
                  ),
                  child: const CircleAvatar(
                    radius: 43,
                    backgroundImage: AssetImage(AppImages.profileImageTest),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(
            height: 23,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.p),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.p),
              child: strategy.buildLayout(cards),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 23.p),
            child: const MEETINGPOINTSection(),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.p),
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
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 23.p),
            child: const EarningsSummaryCard(),
          ),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}
