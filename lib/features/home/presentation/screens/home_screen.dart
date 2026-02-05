import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/home/presentation/widgets/home_widgets/category_list_view.dart';
import 'package:guide_me/features/home/presentation/widgets/home_widgets/cities_list_view.dart';
import 'package:guide_me/features/home/presentation/widgets/home_widgets/home_header.dart';
import 'package:guide_me/features/home/presentation/widgets/home_widgets/most_famous_trip_list_view.dart';
import 'package:guide_me/features/home/presentation/widgets/home_widgets/places_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          // header
          const HomeHeader(),

          const SizedBox(height: 35),

          // category title and filter button
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.p),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.l10n.category,
                  style: AppTextStyles.poppinsBold18.copyWith(
                    color: AppColors.blue,
                  ),
                ),

                InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {
                    context.push(AppRoutes.filterScreen);
                  },
                  child: Icon(
                    Icons.filter_alt,
                    color: AppColors.primary,
                    size: 26.ic,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // categories list
          SizedBox(
            height: context.isPortrait ? size.height * 0.12 : size.width * 0.12,
            child: const CategoryListView(),
          ),

          const SizedBox(height: 40),

          // The most famous trip Text
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.p),
            child: Text(
              context.l10n.mostFamousTrip,
              style: AppTextStyles.poppinsBold18.copyWith(
                color: AppColors.blue,
              ),
            ),
          ),

          const SizedBox(height: 16),

          // most famous trip list
          SizedBox(
            height: context.isPortrait ? size.height * 0.41 : size.width * 0.41,
            child: const MostFamousTripListView(),
          ),

          const SizedBox(height: 32),

          // Travel Beyond Boundary Text
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.p),
            child: Text(
              context.l10n.travelBeyondBoundary,
              style: AppTextStyles.poppinsBold18.copyWith(
                color: AppColors.blue,
              ),
            ),
          ),

          const SizedBox(height: 22),

          // Travel Beyond Boundary list
          SizedBox(
            height: context.isPortrait ? size.height * 0.37 : size.width * 0.37,
            child: const PlacesListView(),
          ),

          const SizedBox(height: 10),

          // Popular Cities Text
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.p),
            child: Text(
              context.l10n.popularCities,
              style: AppTextStyles.poppinsBold18.copyWith(
                color: AppColors.blue,
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Cities List View
          SizedBox(
            height: context.isPortrait ? size.height * 0.24 : size.width * 0.24,
            child: const CitiesListView(),
          ),

          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
