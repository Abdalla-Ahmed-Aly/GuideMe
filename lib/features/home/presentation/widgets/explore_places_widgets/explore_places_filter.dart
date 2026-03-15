import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/features/home/presentation/widgets/explore_places_widgets/custom_filter_text_button.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/features/home/presentation/cubits/get_place_by_category/place_by_category_cubit.dart';

import 'package:guide_me/features/home/presentation/cubits/get_place_by_city/place_by_city_cubit.dart';

class ExplorePlacesFilter extends StatefulWidget {
  const ExplorePlacesFilter({
    super.key,
    this.categoryId,
    this.cityId,
  });

  final String? categoryId;
  final String? cityId;

  @override
  State<ExplorePlacesFilter> createState() => _ExplorePlacesFilterState();
}

class _ExplorePlacesFilterState extends State<ExplorePlacesFilter> {
  int selectedIndex = 0;

  void _onFilterTap(int index, String filter) {
    setState(() {
      selectedIndex = index;
    });

    if (widget.categoryId != null) {
      final cubit = context.read<PlaceByCategoryCubit>();
      cubit.getPlacesByCategory(
        categoryId: widget.categoryId!,
        filter: filter,
      );
    } else if (widget.cityId != null) {
      final cubit = context.read<PlaceByCityCubit>();
      cubit.getPlacesByCity(
        cityId: widget.cityId!,
        filter: filter,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 44.p),
      decoration: BoxDecoration(
        color: AppColors.natural5,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomFilterTextButton(
            text: context.l10n.popular,
            isSelected: selectedIndex == 0,
            onTap: () => _onFilterTap(0, 'popular'),
          ),
          CustomFilterTextButton(
            text: context.l10n.best,
            isSelected: selectedIndex == 1,
            onTap: () => _onFilterTap(1, 'best'),
          ),
          CustomFilterTextButton(
            text: context.l10n.cheap,
            isSelected: selectedIndex == 2,
            onTap: () => _onFilterTap(2, 'cheap'),
          ),
        ],
      ),
    );
  }
}
