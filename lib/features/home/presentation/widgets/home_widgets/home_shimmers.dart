import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/widgets/custom_shimmer.dart';

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final width = context.isPortrait ? size.height * 0.075 : size.width * 0.075;
    return Container(
      margin: const EdgeInsets.only(right: 30),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          CustomShimmer(
            width: width,
            height: width,
            borderRadius: 20,
          ),
          const SizedBox(height: 10),
          CustomShimmer(
            width: width * 1.1,
            height: 12,
            borderRadius: 4,
          ),
        ],
      ),
    );
  }
}

class CityShimmer extends StatelessWidget {
  const CityShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final width = context.isPortrait ? size.height * 0.23 : size.width * 0.23;
    return CustomShimmer(
      width: width,
      height: 150, // Typical height for CityCard
      borderRadius: 12,
      margin: const EdgeInsets.only(right: 16),
    );
  }
}

class PlaceShimmer extends StatelessWidget {
  const PlaceShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final width = context.isPortrait ? size.height * 0.25 : size.width * 0.25;
    final imageHeight = context.isPortrait
        ? size.height * 0.23
        : size.width * 0.23;

    return Container(
      width: width,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomShimmer(
            width: width,
            height: imageHeight,
            borderRadius: 20,
          ),
          const SizedBox(height: 8),
          const CustomShimmer(
            width: 150,
            height: 16,
            borderRadius: 4,
          ),
          const SizedBox(height: 4),
          const CustomShimmer(
            width: 100,
            height: 12,
            borderRadius: 4,
          ),
        ],
      ),
    );
  }
}

class PlaceListTileShimmer extends StatelessWidget {
  const PlaceListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Row(
        children: [
          CustomShimmer(
            width: 100,
            height: 100,
            borderRadius: 12,
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomShimmer(width: double.infinity, height: 16),
                SizedBox(height: 8),
                CustomShimmer(width: 150, height: 12),
                SizedBox(height: 8),
                CustomShimmer(width: 80, height: 12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
