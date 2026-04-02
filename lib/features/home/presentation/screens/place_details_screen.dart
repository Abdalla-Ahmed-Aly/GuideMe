import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/shared/entities/place_entity.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/features/home/presentation/widgets/place_details_widgets/details_header.dart';
import 'package:guide_me/features/home/presentation/widgets/place_details_widgets/place_details_section.dart';
import 'package:guide_me/features/home/presentation/widgets/place_details_widgets/place_location_on_map_section.dart';
import 'package:guide_me/features/home/presentation/widgets/place_details_widgets/review_summary.dart';

class PlaceDetailsScreen extends StatelessWidget {
  const PlaceDetailsScreen({super.key, required this.place});
  final PlaceEntity place;

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

          const SizedBox(height: 16),

          // Location
          if (place.location != null &&
              place.location!.lat != null &&
              place.location!.lng != null)
            PlaceLocationOnMapSection(place: place),

          const SizedBox(height: 22),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.p),
            child: AppButton(
              onPressed: () {
                context.push(AppRoutes.bookScreen, extra: place);
              },
              text: context.l10n.bookNow,
              textStyle: AppTextStyles.interSemiBold18,
              radius: 16,
            ),
          ),

          SizedBox(height: MediaQuery.of(context).padding.bottom + 12),
        ],
      ),
    );
  }
}
