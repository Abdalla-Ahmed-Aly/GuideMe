import 'package:flutter/material.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/booking/presentation/widgets/book_tour_widgets/information_tour_guide.dart';
import 'package:guide_me/features/booking/presentation/widgets/book_tour_widgets/primary_action_button.dart';
import 'package:guide_me/features/booking/presentation/widgets/book_tour_widgets/profile_of_tour_guide.dart';

class GuideInfoCard extends StatelessWidget {
  const GuideInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // image & name
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.p),
          child: const ProfileOfTourGuide(),
        ),

        const SizedBox(height: 16),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.p),
          child: Text(
            "Experienced guide with a deep knowledge of pharaonic history and archaeology, passionate",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.interBold14,
          ),
        ),

        SizedBox(height: 16.h),

        const InformationTourGuide(),

        SizedBox(height: 25.h),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.p),
          child: const PrimaryActionButton(),
        ),

        const SizedBox(height: 20),
      ],
    );
  }
}
