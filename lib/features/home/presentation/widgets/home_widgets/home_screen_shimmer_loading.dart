import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/features/home/presentation/widgets/home_widgets/ai_trip_loading.dart';
import 'package:guide_me/features/home/presentation/widgets/home_widgets/home_header.dart';
import 'package:guide_me/features/home/presentation/widgets/home_widgets/home_section_title.dart';
import 'package:guide_me/features/home/presentation/widgets/home_widgets/home_shimmers.dart';

class HomeScreenShimmerLoading extends StatelessWidget {
  const HomeScreenShimmerLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        // ✅ header
        const HomeHeader(),
        const SizedBox(height: 20),

        // ✅ عنوان Category
        HomeSectionTitle(title: context.l10n.category),
        const SizedBox(height: 20),

        // ✅ SizedBox بـ height محددة للـ horizontal ListView
        SizedBox(
          height: context.isPortrait
              ? context.screenHeight * 0.13
              : context.screenWidth * 0.12,
          child: ListView.builder(
            padding: EdgeInsets.only(left: 20.p),
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) => const CategoryShimmer(),
          ),
        ),
        const SizedBox(height: 40),

        HomeSectionTitle(title: context.l10n.aiTravelSuggestions),
        const SizedBox(height: 16),

        SizedBox(
          height: context.isPortrait
              ? context.screenHeight * 0.41
              : context.screenWidth * 0.41,
          child: const AiTripLoading(),
        ),

        const SizedBox(height: 32),

        HomeSectionTitle(title: context.l10n.travelBeyondBoundary),
        const SizedBox(height: 22),

        SizedBox(
          height: context.isPortrait
              ? context.screenHeight * 0.37
              : context.screenWidth * 0.37,
          child: ListView.builder(
            padding: EdgeInsets.only(left: 20.p),
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) => const PlaceShimmer(),
          ),
        ),
        const SizedBox(height: 10),

        HomeSectionTitle(title: context.l10n.popularCities),
        const SizedBox(height: 20),

        SizedBox(
          height: context.isPortrait
              ? context.screenHeight * 0.24
              : context.screenWidth * 0.24,
          child: ListView.builder(
            padding: EdgeInsets.only(left: 20.p),
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) => const CityShimmer(),
          ),
        ),
        const SizedBox(height: 25),
      ],
    );
  }
}
