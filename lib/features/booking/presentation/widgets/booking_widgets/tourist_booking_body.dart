import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/features/booking/presentation/widgets/booking_widgets/today_booking_list_view.dart';

class BookingBody extends StatelessWidget {
  const BookingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.p),
            child: Row(
              children: [
                Expanded(
                  child: AppButton(
                    onPressed: () {},
                    text: context.l10n.upcomingBookings,
                    textStyle: AppTextStyles.interBold14,
                    height: 48,
                  ),
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: AppButton(
                    onPressed: () {},
                    text: context.l10n.pastBookings,
                    textStyle: AppTextStyles.interBold14,
                    height: 48,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 28),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.p),
            child: Text(
              context.l10n.todayBookings,
              style: AppTextStyles.poppinsSemiBold24.copyWith(
                color: AppColors.black,
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Today's booking list view
          const TodayBookingListView(),
        ],
      ),
    );
  }
}
