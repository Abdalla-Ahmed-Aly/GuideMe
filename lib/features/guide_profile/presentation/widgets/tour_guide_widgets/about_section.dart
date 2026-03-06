import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.p, vertical: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n.about,
                style: AppTextStyles.interBold18,
              ),

              GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.edit_outlined,
                  color: Color(0xff64748B),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Text(
            "Dedicated Egyptologist with over 12 years of experience guiding visitors through the majestic history of Ancient Egypt. Specialized in Giza Pyramids, Luxor temples, and the Egyptian Museum. My goal is to bring history to life through storytelling and deep academic insights.",
            style: AppTextStyles.interRegular16.copyWith(
              color: const Color(0xff475569),
            ),
          ),
        ],
      ),
    );
  }
}
