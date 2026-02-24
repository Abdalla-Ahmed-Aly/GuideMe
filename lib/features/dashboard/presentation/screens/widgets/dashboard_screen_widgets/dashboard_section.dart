import 'package:flutter/material.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/features/dashboard/presentation/screens/widgets/dashboard_screen_widgets/Availability_Status_Section.dart';
import 'package:guide_me/features/dashboard/presentation/screens/widgets/dashboard_screen_widgets/user_profile_header.dart';

class DashboardSection extends StatelessWidget {
  const DashboardSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          const UserProfileHeader(),
          const SizedBox(
            height: 26,
          ),
          Padding(
            padding: EdgeInsets.only(left: 21.p, right: 15.p),
            child: const AvailabilityStatusSection(),
          ),
        ],
      ),
    );
  }
}
