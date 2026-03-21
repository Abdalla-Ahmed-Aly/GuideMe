import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/entites/place_entity.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/features/home/presentation/widgets/place_details_widgets/details_header.dart';
import 'package:guide_me/features/home/presentation/widgets/place_details_widgets/place_details_section.dart';
import 'package:guide_me/features/home/presentation/widgets/place_details_widgets/review_summary.dart';

class PlaceDetailsScreen extends StatelessWidget {
  final PlaceEntity place;
  const PlaceDetailsScreen({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          // images and arrow back
          SizedBox(
            height: size.height * 0.38,
            child: DetailsHeader(place: place),
          ),

          const SizedBox(height: 30),

          // title and price and location and trip details
          PlaceDetailsSection(place: place),

          const SizedBox(height: 22),

          // Rating
          ReviewSummary(place: place),

          const SizedBox(height: 14),

          // Location
          Container(
            height: size.height * 0.28,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.natural2,
            ),
            child: Center(
              child: Icon(
                Icons.location_on,
                size: 70.ic,
                color: AppColors.primary,
              ),
            ),
          ),

          const SizedBox(height: 22),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 44.p),
            child: AppButton(
              onPressed: () {
                context.push(AppRoutes.bookScreen);
              },
              text: context.l10n.bookNow,
              textStyle: AppTextStyles.interSemiBold18,
            ),
          ),

          const SizedBox(height: 44),
        ],
      ),
    );
  }
}
