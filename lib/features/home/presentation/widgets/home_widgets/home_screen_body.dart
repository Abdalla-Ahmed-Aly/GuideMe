import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/home/domain/entity/home_entity.dart';
import 'package:guide_me/features/home/presentation/cubits/get_ai_package/get_ai_package_cubit.dart';
import 'package:guide_me/features/home/presentation/cubits/get_home_data/get_home_cubit.dart';
import 'package:guide_me/features/home/presentation/widgets/home_widgets/category_list_view.dart';
import 'package:guide_me/features/home/presentation/widgets/home_widgets/cities_list_view.dart';
import 'package:guide_me/features/home/presentation/widgets/home_widgets/filter_button.dart';
import 'package:guide_me/features/home/presentation/widgets/home_widgets/home_header.dart';
import 'package:guide_me/features/home/presentation/widgets/home_widgets/home_section_title.dart';
import 'package:guide_me/features/home/presentation/widgets/home_widgets/most_famous_trip_list_view.dart';
import 'package:guide_me/features/home/presentation/widgets/home_widgets/places_list_view.dart';

class HomeScreenBody extends StatelessWidget {
  final HomeEntity homeData;
  const HomeScreenBody({super.key, required this.homeData});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await context.read<GetHomeCubit>().getHomeData();
        await context.read<GetAiPackageCubit>().getAiPackages();
      },
      child: ListView(
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

                const FilterButton(),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // categories list
          SizedBox(
            height: context.isPortrait
                ? context.screenHeight * 0.14
                : context.screenWidth * 0.14,
            child: CategoryListView(categories: homeData.categories),
          ),

          const SizedBox(height: 20),

          // The most famous trip Text
          HomeSectionTitle(title: context.l10n.aiTravelSuggestions),

          const SizedBox(height: 16),

          // most famous trip list
          SizedBox(
            height: context.isPortrait
                ? context.screenHeight * 0.41
                : context.screenWidth * 0.41,
            child: const MostFamousTripListView(),
          ),

          const SizedBox(height: 32),

          // Travel Beyond Boundary Text
          HomeSectionTitle(title: context.l10n.travelBeyondBoundary),

          const SizedBox(height: 22),

          // Travel Beyond Boundary list
          SizedBox(
            height: context.isPortrait
                ? context.screenHeight * 0.37
                : context.screenWidth * 0.37,
            child: PlacesListView(
              travelBeyondBoundary: homeData.travelBeyondBoundary,
            ),
          ),

          const SizedBox(height: 10),

          // Popular Cities Text
          HomeSectionTitle(title: context.l10n.popularCities),

          const SizedBox(height: 20),

          // Cities List View
          SizedBox(
            height: context.isPortrait
                ? context.screenHeight * 0.24
                : context.screenWidth * 0.24,
            child: CitiesListView(
              popularCities: homeData.popularCities,
            ),
          ),

          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
