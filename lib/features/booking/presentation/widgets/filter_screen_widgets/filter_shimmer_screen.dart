import 'package:flutter/material.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/features/booking/presentation/widgets/filter_screen_widgets/cities_wrap_shimmer_loading.dart';
import 'package:shimmer/shimmer.dart';

class FilterShimmerScreen extends StatelessWidget {
  const FilterShimmerScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24.p, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildShimmerContainer(
            height: 24,
            width: 150,
          ),

          const SizedBox(height: 16),

          _buildShimmerContainer(
            height: 160.h,
          ),

          const SizedBox(height: 24),

          _buildShimmerContainer(
            height: 24,
            width: 150.w,
          ),

          const SizedBox(height: 16),

          const CitiesWrapShimmerLoading(),

          const SizedBox(height: 24),

          _buildShimmerContainer(
            height: 24,
            width: 150.w,
          ),

          const SizedBox(height: 16),

          _buildShimmerContainer(
            height: 180.h,
          ),
        ],
      ),
    );
  }

  Shimmer _buildShimmerContainer({double? height, double? width}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: height ?? 200.h,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
