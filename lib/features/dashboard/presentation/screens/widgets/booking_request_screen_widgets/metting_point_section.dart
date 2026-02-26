import 'package:flutter/material.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/features/dashboard/presentation/screens/widgets/booking_request_screen_widgets/meeting_point_header.dart';

class MEETINGPOINTSection extends StatelessWidget {
  const MEETINGPOINTSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: const Color(0xffFFE5BA)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          const MeetingPointHeader(),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 7.p),
            child: const MettingPointLocation(),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

class MettingPointLocation extends StatelessWidget {
  const MettingPointLocation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffCC914A)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Image.asset(
        AppImages.mettingpointlocation,
        fit: BoxFit.fill,
      ),
    );
  }
}
