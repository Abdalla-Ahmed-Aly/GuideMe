import 'package:flutter/material.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/features/home/presentation/widgets/explore_places_widgets/explore_places_app_bar.dart';
import 'package:guide_me/features/home/presentation/widgets/explore_places_widgets/explore_places_filter.dart';

class ExplorePlacesHeader extends StatelessWidget {
  const ExplorePlacesHeader({
    super.key,
    required this.title,
    this.categoryId,
    this.cityId,
  });

  final String title;
  final String? categoryId;
  final String? cityId;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: size.height * 0.05),

        // App bar
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.p),
          child: ExplorePlacesAppBar(title: title),
        ),

        const SizedBox(height: 30),

        // Filter
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.p),
          child: ExplorePlacesFilter(
            categoryId: categoryId,
            cityId: cityId,
          ),
        ),
      ],
    );
  }
}
