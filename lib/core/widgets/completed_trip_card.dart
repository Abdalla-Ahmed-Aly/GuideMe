import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class CompletedTripCard extends StatelessWidget {
  const CompletedTripCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRoutes.completedtripdetailes);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: const Color(0xffF0F0F0),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: const Color(0xffBFBFBF).withValues(alpha: .7),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Time
            Text(
              "02:30 PM",
              style: AppTextStyles.poppinsMedium14.copyWith(
                color: const Color(0xffC3C3C3),
              ),
            ),

            const SizedBox(height: 2),

            // Place Title
            Text(
              "Egyption Museum & Treasures",
              style: AppTextStyles.poppinsMedium18.copyWith(
                color: const Color(0xffC3C3C3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
