import 'package:flutter/material.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class PickCard extends StatelessWidget {
  const PickCard({
    super.key,
    required this.title,
    required this.icon,
    required this.subTitle,
    required this.value,
    required this.onTap,
  });
  final String title;
  final IconData icon;
  final String subTitle;
  final String value;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              title,
              style: AppTextStyles.poppinsSemiBold16.copyWith(
                color: const Color(0xff64748B),
              ),
            ),
          ),

          const SizedBox(height: 12),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xffF1F5F9)),
            ),

            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: .1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    icon,
                    color: AppColors.primary,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        subTitle,
                        style: AppTextStyles.poppinsMedium16.copyWith(
                          color: const Color(0xff64748B),
                        ),
                      ),

                      const SizedBox(height: 4),

                      Text(
                        value,
                        style: AppTextStyles.poppinsSemiBold18,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
