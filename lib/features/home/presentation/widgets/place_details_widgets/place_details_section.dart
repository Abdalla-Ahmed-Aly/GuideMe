import 'package:flutter/material.dart';
import 'package:guide_me/core/entites/place_entity.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class PlaceDetailsSection extends StatelessWidget {
  final PlaceEntity place;
  const PlaceDetailsSection({super.key, required this.place});

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
                  place.title,
                  style: AppTextStyles.poppinsBold28,
                ),
              ),
              const SizedBox(width: 6),

              Column(
                children: [
                  Text(
                    "\$ ${place.price}",
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
        if (place.location != null)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.p),
            child: Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: AppColors.primary,
                  size: 24.ic,
                ),

                const SizedBox(width: 7),

                Expanded(
                  child: Text(
                    "Location: ${place.location!.name}",
                    style: AppTextStyles.interRegular14,
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
            style: AppTextStyles.interSemiBold16.copyWith(
              color: AppColors.natural6,
            ),
          ),
        ),

        const SizedBox(height: 8),

        if (place.description != null)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.p),
            child: Text(
              place.description!,
              style: AppTextStyles.interRegular14,
            ),
          ),
      ],
    );
  }
}
