import 'package:flutter/material.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/features/dashboard/presentation/widgets/analysis%20_screen_widgets/analysis_card_shimmer.dart';
import 'package:shimmer/shimmer.dart';

class AnalysisScreenShimmerLoading extends StatelessWidget {
  const AnalysisScreenShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 22.p),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),

          Row(
            children: [
              Expanded(child: _buildShimmerCard()),
              const SizedBox(width: 20),
              Expanded(child: _buildShimmerCard()),
            ],
          ),

          const SizedBox(height: 16),

          _buildShimmerCard(height: 20, width: 100),

          const SizedBox(height: 12),

          const AnalysisCardShimmer(),

          const SizedBox(height: 12),

          _buildShimmerCard(height: 40),

          const SizedBox(height: 12),

          _buildShimmerCard(height: 200.h),
        ],
      ),
    );
  }

  Widget _buildShimmerCard({
    double height = 140,
    double width = double.infinity,
  }) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
