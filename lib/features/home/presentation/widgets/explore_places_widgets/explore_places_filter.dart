import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/features/home/presentation/widgets/explore_places_widgets/custom_filter_text_button.dart';

class ExplorePlacesFilter extends StatefulWidget {
  const ExplorePlacesFilter({super.key});

  @override
  State<ExplorePlacesFilter> createState() => _ExplorePlacesFilterState();
}

class _ExplorePlacesFilterState extends State<ExplorePlacesFilter> {
  int selectedIndex = 1;
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
            onTap: () {
              setState(() {
                selectedIndex = 0;
              });
            },
          ),
          CustomFilterTextButton(
            text: context.l10n.best,
            isSelected: selectedIndex == 1,
            onTap: () {
              setState(() {
                selectedIndex = 1;
              });
            },
          ),
          CustomFilterTextButton(
            text: context.l10n.cheap,
            isSelected: selectedIndex == 2,
            onTap: () {
              setState(() {
                selectedIndex = 2;
              });
            },
          ),
        ],
      ),
    );
  }
}
