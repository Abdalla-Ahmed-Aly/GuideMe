import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/features/home/presentation/cubits/interests_cubit/interests_cubit.dart';
import 'package:guide_me/features/home/presentation/strategies/interests_strategy/interests_grid_factory.dart';
import 'package:shimmer/shimmer.dart';

class InterestsGridShimmer extends StatelessWidget {
  const InterestsGridShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final interestsCubit = context.read<InterestsCubit>();
    final strategy = InterestsGridFactory.getStrategy(context.screenWidth);
    return GridView.builder(
      padding: EdgeInsets.symmetric(
        horizontal: 60.p,
        vertical: 8,
      ),
      physics: const ClampingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: strategy.getCrossAxisCount(),
        crossAxisSpacing: 50,
        mainAxisSpacing: 20,
        childAspectRatio: strategy.getAspectRatio(),
      ),
      itemCount: 5,
      itemBuilder: (context, index) {
        return const InterestsCardShimmer();
      },
    );
  }
}

class InterestsCardShimmer extends StatelessWidget {
  const InterestsCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            width: 100.w,
            height: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
