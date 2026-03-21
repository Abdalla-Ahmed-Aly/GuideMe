import 'package:flutter/material.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:shimmer/shimmer.dart';

class GuideProfileShimmerScreen extends StatelessWidget {
  const GuideProfileShimmerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.p),
      physics: const ClampingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),

          Center(
            child: Column(
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    height: 144,
                    width: 144,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                _buildShimmerContainer(width: 150.w, height: 22),

                const SizedBox(height: 4),

                _buildShimmerContainer(width: 250.w, height: 14),

                const SizedBox(height: 4),

                _buildShimmerContainer(width: 150.w, height: 14),

                const SizedBox(height: 20),

                _buildShimmerContainer(width: 150.w, height: 24),
              ],
            ),
          ),

          const SizedBox(height: 20),

          _buildShimmerContainer(height: 24),

          const SizedBox(height: 14),

          _buildShimmerTile(),

          const SizedBox(height: 10),

          _buildShimmerTile(),

          const SizedBox(height: 20),

          _buildShimmerContainer(height: 24),

          const SizedBox(height: 14),

          _buildShimmerTile(),

          const SizedBox(height: 10),

          _buildShimmerTile(),

          const SizedBox(height: 20),

          _buildShimmerContainer(height: 24),

          const SizedBox(height: 14),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildShimmerContainer(width: 24, height: 24, radius: 8),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildShimmerContainer(width: 150.w, height: 18),

                  const SizedBox(height: 8),

                  _buildShimmerContainer(width: 250.w, height: 14),

                  const SizedBox(height: 8),

                  _buildShimmerContainer(width: 100.w, height: 14),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Row _buildShimmerTile() {
    return Row(
      children: [
        _buildShimmerContainer(width: 24, height: 24, radius: 8),
        const SizedBox(width: 12),
        _buildShimmerContainer(width: 200.w, height: 18),
      ],
    );
  }

  Shimmer _buildShimmerContainer({
    double width = 150,
    double height = 20,
    double? radius,
  }) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(radius ?? 20),
        ),
      ),
    );
  }
}
