import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/booking/presentation/widgets/booking_widgets/booking_profile.dart';
import 'package:guide_me/features/booking/presentation/widgets/booking_widgets/booking_status_filter.dart';
import 'package:guide_me/features/booking/presentation/widgets/booking_widgets/schedule_list_view.dart';
import 'package:guide_me/features/booking/presentation/widgets/booking_widgets/trips_list_view.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F7F5),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: context.screenHeight * 0.05),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.p),
            child: const BookingProfile(),
          ),

          const SizedBox(height: 16),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.p),
            child: Text(
              context.l10n.mySchedule,
              style: AppTextStyles.poppinsBold20,
            ),
          ),

          const SizedBox(height: 8),

          // schedule list view
          const SizedBox(
            height: 80,
            child: ScheduleListView(),
          ),

          const SizedBox(height: 20),

          const BookingStatusFilter(),

          const SizedBox(height: 8),

          const Expanded(
            child: TripsListView(),
          ),
        ],
      ),
    );
  }
}
