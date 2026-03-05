import 'package:flutter/material.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class LiveTrackingDetailsCard extends StatelessWidget {
  const LiveTrackingDetailsCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });
  final IconData icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
            color: Color(0xffFFEAEA),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: const Color(0xffF2930D),
            size: 24,
          ),
        ),

        const SizedBox(width: 16),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyles.poppinsRegular14.copyWith(
                  color: const Color(0xff9D9D9D),
                ),
              ),

              const SizedBox(height: 4),

              Text(
                value,
                style: AppTextStyles.poppinsMedium14,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
