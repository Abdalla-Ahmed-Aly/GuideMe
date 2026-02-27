import 'package:flutter/material.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class InfoStatusCard extends StatelessWidget {
  const InfoStatusCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });
  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xffDD7B03).withValues(alpha: .3),
        ),
      ),

      child: Column(
        children: [
          Icon(
            icon,
            color: const Color(0xffDD7B03),
            size: 30,
          ),

          const SizedBox(height: 2),

          Text(
            title,
            style: AppTextStyles.poppinsMedium14.copyWith(
              color: const Color(0xffACACAC),
            ),
          ),

          const SizedBox(height: 2),

          Text(
            subtitle,
            style: AppTextStyles.poppinsSemiBold14,
          ),
        ],
      ),
    );
  }
}
