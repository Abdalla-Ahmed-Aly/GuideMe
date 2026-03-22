import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/home/presentation/cubits/get_ai_package/get_ai_package_cubit.dart';
import 'package:guide_me/features/home/presentation/cubits/get_home_data/get_home_cubit.dart';
import 'package:guide_me/features/home/presentation/cubits/get_home_data/get_home_state.dart';
import 'package:guide_me/features/home/presentation/widgets/home_widgets/category_list_view.dart';
import 'package:guide_me/features/home/presentation/widgets/home_widgets/cities_list_view.dart';
import 'package:guide_me/features/home/presentation/widgets/home_widgets/home_header.dart';
import 'package:guide_me/features/home/presentation/widgets/home_widgets/most_famous_trip_list_view.dart';
import 'package:guide_me/features/home/presentation/widgets/home_widgets/places_list_view.dart';

import 'package:guide_me/features/home/presentation/widgets/home_widgets/home_shimmers.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.p),
      child: Text(
        title,
        style: AppTextStyles.poppinsBold18.copyWith(
          color: AppColors.blue,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: BlocBuilder<GetHomeCubit, GetHomeState>(
        builder: (context, state) {
          if (state is GetHomeLoading) {
            return ListView(
              padding: EdgeInsets.zero,
              children: [
                const HomeHeader(),
                const SizedBox(height: 35),
                _buildSectionTitle(context, context.l10n.category),
                const SizedBox(height: 20),
                SizedBox(
                  height: context.isPortrait
                      ? size.height * 0.13
                      : size.width * 0.12,
                  child: ListView.builder(
                    padding: EdgeInsets.only(left: 20.p),
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) => const CategoryShimmer(),
                  ),
                ),
                const SizedBox(height: 40),
                _buildSectionTitle(context, context.l10n.mostFamousTrip),
                const SizedBox(height: 16),
                SizedBox(
                  height: context.isPortrait
                      ? size.height * 0.41
                      : size.width * 0.41,
                  child: ListView.builder(
                    padding: EdgeInsets.only(left: 20.p),
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) => const PlaceShimmer(),
                  ),
                ),
                const SizedBox(height: 32),
                _buildSectionTitle(context, context.l10n.travelBeyondBoundary),
                const SizedBox(height: 22),
                SizedBox(
                  height: context.isPortrait
                      ? size.height * 0.37
                      : size.width * 0.37,
                  child: ListView.builder(
                    padding: EdgeInsets.only(left: 20.p),
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) => const PlaceShimmer(),
                  ),
                ),
                const SizedBox(height: 10),
                _buildSectionTitle(context, context.l10n.popularCities),
                const SizedBox(height: 20),
                SizedBox(
                  height: context.isPortrait
                      ? size.height * 0.24
                      : size.width * 0.24,
                  child: ListView.builder(
                    padding: EdgeInsets.only(left: 20.p),
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) => const CityShimmer(),
                  ),
                ),
                const SizedBox(height: 25),
              ],
            );
          } else if (state is GetHomeFailure) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 60,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Oops! Something went wrong',
                      style: AppTextStyles.poppinsBold18,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      state.errorMessage,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.poppinsRegular14,
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () =>
                          context.read<GetHomeCubit>().getHomeData(),
                      child: const Text('Try Again'),
                    ),
                  ],
                ),
              ),
            );
          } else if (state is GetHomeSuccess) {
            final homeData = state.homeData;
            return RefreshIndicator(
              onRefresh: () async {
                await Future.wait([
                  context.read<GetHomeCubit>().getHomeData(),
                  context.read<GetAiPackageCubit>().getAiPackages(),
                ]);
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
                    height: context.isPortrait
                        ? size.height * 0.13
                        : size.width * 0.12,
                    child: CategoryListView(categories: homeData.categories),
                  ),

                  const SizedBox(height: 40),

                  // The most famous trip Text
                  _buildSectionTitle(context, context.l10n.mostFamousTrip),

                  const SizedBox(height: 16),

                  // most famous trip list
                  SizedBox(
                    height: context.isPortrait
                        ? size.height * 0.41
                        : size.width * 0.41,
                    child: const MostFamousTripListView(),
                  ),

                  const SizedBox(height: 32),

                  // Travel Beyond Boundary Text
                  _buildSectionTitle(
                    context,
                    context.l10n.travelBeyondBoundary,
                  ),

                  const SizedBox(height: 22),

                  // Travel Beyond Boundary list
                  SizedBox(
                    height: context.isPortrait
                        ? size.height * 0.37
                        : size.width * 0.37,
                    child: PlacesListView(
                      travelBeyondBoundary: homeData.travelBeyondBoundary,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Popular Cities Text
                  _buildSectionTitle(context, context.l10n.popularCities),

                  const SizedBox(height: 20),

                  // Cities List View
                  SizedBox(
                    height: context.isPortrait
                        ? size.height * 0.24
                        : size.width * 0.24,
                    child: CitiesListView(
                      popularCities: homeData.popularCities,
                    ),
                  ),

                  const SizedBox(height: 25),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
