import 'package:flutter/material.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class PendingTripCard extends StatelessWidget {
  const PendingTripCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.black.withValues(alpha: .15),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Time
          Text(
            "02:30 PM",
            style: AppTextStyles.poppinsMedium14,
          ),

          const SizedBox(height: 2),

          // Place Title
          Text(
            "Egyption Museum & Treasures",
            style: AppTextStyles.poppinsMedium18,
          ),
        ],
      ),
    );
  }
}
