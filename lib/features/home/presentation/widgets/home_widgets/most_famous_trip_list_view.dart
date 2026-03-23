import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/features/home/presentation/cubits/get_ai_package/get_ai_package_cubit.dart';
import 'package:guide_me/features/home/presentation/cubits/get_ai_package/get_ai_package_state.dart';
import 'package:guide_me/features/home/presentation/widgets/home_widgets/home_shimmers.dart';
import 'package:guide_me/features/home/presentation/widgets/home_widgets/most_famous_trip_card.dart';

class MostFamousTripListView extends StatefulWidget {
  const MostFamousTripListView({super.key});

  @override
  State<MostFamousTripListView> createState() => _MostFamousTripListViewState();
}

class _MostFamousTripListViewState extends State<MostFamousTripListView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAiPackageCubit, GetAiPackageState>(
      builder: (context, state) {
        if (state is GetAiPackageLoading) {
          final size = MediaQuery.sizeOf(context);
          final height = context.isPortrait
              ? size.height * 0.41
              : size.width * 0.41;
          return SizedBox(
            height: height,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 20.p),
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return TweenAnimationBuilder<double>(
                  duration: Duration(milliseconds: 400 + (index * 150)),
                  tween: Tween(begin: 0.0, end: 1.0),
                  curve: Curves.easeOut,
                  builder: (context, value, child) {
                    return Opacity(
                      opacity: value,
                      child: Transform.translate(
                        offset: Offset(20 * (1 - value), 0),
                        child: child,
                      ),
                    );
                  },
                  child: const AILoadingCard(),
                );
              },
            ),
          );
        } else if (state is GetAiPackageFailure) {
          return Center(child: Text(state.message));
        } else if (state is GetAiPackageSuccess) {
          final size = MediaQuery.sizeOf(context);
          final height = context.isPortrait
              ? size.height * 0.41
              : size.width * 0.41;

          return SizedBox(
            height: height,
            child: ListView.builder(
              clipBehavior: Clip.none,
              controller: _scrollController,
              padding: EdgeInsets.only(left: 20.p, right: 20.p),
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: state.packages.length,
              itemBuilder: (context, index) {
                return AnimatedBuilder(
                  animation: _scrollController,
                  builder: (context, child) {
                    double itemPosition = 0.0;
                    if (_scrollController.hasClients) {
                      // Calculate item position relative to viewport
                      // Approximate item width (width from MostFamousTripCard + margin)
                      double itemWidth = size.width * 0.87 + 16;
                      double offset = _scrollController.offset;
                      double viewportWidth = size.width;

                      // Position of the item's center
                      double itemCenter = (index * itemWidth) + (itemWidth / 2);
                      // Distance from center of viewport
                      double distance =
                          (itemCenter - offset - (viewportWidth / 2)).abs();
                      // Normalize distance (0.0 at center, 1.0 at edge)
                      itemPosition = (distance / (viewportWidth / 1.5)).clamp(
                        0.0,
                        1.0,
                      );
                    }

                    return TweenAnimationBuilder<double>(
                      duration: Duration(milliseconds: 600 + (index * 100)),
                      tween: Tween(begin: 0.0, end: 1.0),
                      curve: Curves.easeOutQuart,
                      builder: (context, value, child) {
                        // Combined staggered entry + scroll-based 3D rotation/scale

                        double rotation = itemPosition * 0.1; // Slight 3D tilt

                        double magnetic = (1 - itemPosition).clamp(0.0, 1.0);
                        double scale = (0.9 + (magnetic * 0.1)) * value;
                        double translateY = (1 - magnetic) * 20;

                        return Transform(
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.001)
                            ..rotateY(itemPosition * 0.1)
                            ..scale(scale),
                          alignment: Alignment.center,
                          child: Transform.translate(
                            offset: Offset(0, translateY),
                            child: Opacity(
                              opacity: value,
                              child: child,
                            ),
                          ),
                        );
                      },
                      child: MostFamousTripCard(
                        package: state.packages[index],
                        scrollOffset: _scrollController.hasClients
                            ? _scrollController.offset
                            : 0.0,
                        index: index,
                      ),
                    );
                  },
                );
              },
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
