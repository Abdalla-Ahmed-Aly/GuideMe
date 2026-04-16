import 'package:flutter/material.dart';
import 'package:guide_me/core/widgets/custom_shimmer.dart';

class AnalysisCardShimmer extends StatelessWidget {
  const AnalysisCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.orange.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomShimmer(
                width: 60,
                height: 36,
                borderRadius: 4,
              ),
              SizedBox(height: 8),
              CustomShimmer(
                width: 75,
                height: 14,
                borderRadius: 2,
              ),
              SizedBox(height: 4),
              CustomShimmer(
                width: 15,
                height: 14,
                borderRadius: 2,
              ),
            ],
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(5, (index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    children: [
                      CustomShimmer(
                        width: 10,
                        height: 12,
                        borderRadius: 2,
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: CustomShimmer(
                          width: double.infinity,
                          height: 10,
                          borderRadius: 5,
                        ),
                      ),
                      SizedBox(width: 8),
                      CustomShimmer(
                        width: 20,
                        height: 12,
                        borderRadius: 2,
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}