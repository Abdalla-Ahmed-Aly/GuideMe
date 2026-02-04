import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class PlaceDetailsSection extends StatelessWidget {
  const PlaceDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // title and price
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.p),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  "The Grand Egyptian Museum",
                  style: AppTextStyles.poppinsBold28,
                ),
              ),
              const SizedBox(width: 6),

              Column(
                children: [
                  Text(
                    "\$ 50",
                    style: AppTextStyles.interSemiBold20,
                  ),
                  Text(
                    context.l10n.forTrip,
                    style: AppTextStyles.interRegular12,
                  ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 22),

        // location
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.p),
          child: Row(
            children: [
              Icon(
                Icons.location_on,
                color: AppColors.primary,
                size: 10.ic,
              ),

              const SizedBox(width: 7),

              Expanded(
                child: Text(
                  "Location: Cairo - Alexandria Desert Rd, Kafr Nassar, Al Haram, Giza Governorate",
                  style: AppTextStyles.interRegular8,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        Divider(
          indent: 38.p,
          endIndent: 38.p,
          thickness: 2,
        ),

        const SizedBox(height: 14),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.p),
          child: Text(
            context.l10n.tripDetails,
            style: TextStyle(
              fontFamily: AppTextStyles.familyMontserrat,
              color: AppColors.natural6,
              fontSize: 16.fs,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        const SizedBox(height: 8),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.p),
          child: Text(
            "The GEM is the largest archaeological museum in the world combining modern design with ancient treasures. Visitors explore halls dedicated to Tutankhamun and other pharaohs. The museum’s technology, lighting, and presentation bring history to life, making it a futuristic yet educational experience. Every artifact tells a story of Egypt’s grandeur and civilization. The museum offers a glimpse into both the past and the future of archaeological display.",
            style: AppTextStyles.interRegular12,
          ),
        ),
      ],
    );
  }
}
