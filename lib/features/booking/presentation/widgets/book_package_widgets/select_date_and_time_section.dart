import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class SelectDateAndTimeSection extends StatelessWidget {
  const SelectDateAndTimeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: PickCard(
            title: context.l10n.dateCapital,
            icon: Icons.calendar_month_outlined,
            subTitle: context.l10n.selected,
            value: "12/12/2022",
          ),
        ),

        const SizedBox(width: 16),

        Expanded(
          child: PickCard(
            title: context.l10n.timeCapital,
            icon: Icons.access_time_outlined,
            subTitle: context.l10n.schedule,
            value: "12:00 PM",
          ),
        ),
      ],
    );
  }
}

class PickCard extends StatelessWidget {
  const PickCard({
    super.key,
    required this.title,
    required this.icon,
    required this.subTitle,
    required this.value,
  });
  final String title;
  final IconData icon;
  final String subTitle;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
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

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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

              const SizedBox(height: 8),

              Text(
                subTitle,
                style: AppTextStyles.poppinsMedium16.copyWith(
                  color: const Color(0xff64748B),
                ),
              ),

              const SizedBox(height: 8),

              Text(
                value,
                style: AppTextStyles.poppinsSemiBold18,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
