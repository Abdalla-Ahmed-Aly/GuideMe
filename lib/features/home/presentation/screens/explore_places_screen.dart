import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/di/injectable.dart';
import 'package:guide_me/features/home/presentation/cubits/get_place_by_category/place_by_category_cubit.dart';
import 'package:guide_me/features/home/presentation/widgets/explore_places_widgets/explore_places_header.dart';
import 'package:guide_me/features/home/presentation/widgets/explore_places_widgets/explore_places_list_view.dart';

import 'package:guide_me/features/home/presentation/cubits/get_place_by_city/place_by_city_cubit.dart';

class ExplorePlacesScreen extends StatelessWidget {
  const ExplorePlacesScreen({
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => categoryId != null
              ? (getIt<PlaceByCategoryCubit>()
                  ..getPlacesByCategory(categoryId: categoryId!))
              : getIt<PlaceByCategoryCubit>(),
        ),
        BlocProvider(
          create: (context) => cityId != null
              ? (getIt<PlaceByCityCubit>()..getPlacesByCity(cityId: cityId!))
              : getIt<PlaceByCityCubit>(),
        ),
      ],
      child: Scaffold(
        body: Column(
          children: [
            // header
            ExplorePlacesHeader(
              title: title,
              categoryId: categoryId,
              cityId: cityId,
            ),

            const SizedBox(height: 8),

            // Places List View
            Expanded(
              child: ExplorePlacesListView(
                categoryId: categoryId,
                cityId: cityId,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
