import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/user_profile_tile.dart';
import 'package:guide_me/core/widgets/schedule_list.dart';
import 'package:guide_me/features/booking/presentation/widgets/tourist_booking_widgets/trips_list_view.dart';

import '../widgets/guide_booking_status_filter.dart';

class GuideBookingScreen extends StatelessWidget {
  const GuideBookingScreen({super.key});

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
            child: UserProfileTile(
              onTap: () {
                context.push(AppRoutes.tourGuideProfileScreen);
              },
            ),
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
          SizedBox(
            height: context.isPortrait
                ? context.screenHeight * .087
                : context.screenWidth * .087,
            // height: 80.h,
            child: const ScheduleList(),
          ),

          const SizedBox(height: 20),

          const GuideBookingStatusFilter(),

          const SizedBox(height: 8),

          const Expanded(
            child: TripsListView(),
          ),
        ],
      ),
    );
  }
}
