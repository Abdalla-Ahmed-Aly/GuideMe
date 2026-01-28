import 'package:flutter/material.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/features/auth/presentation/widgets/choose_nationality_widgets/country_item.dart';

class CountriesListView extends StatefulWidget {
  const CountriesListView({super.key});

  @override
  State<CountriesListView> createState() => _CountriesListViewState();
}

class _CountriesListViewState extends State<CountriesListView> {
  int selectedCountry = 0;

  @override
  Widget build(BuildContext context) {
    return RawScrollbar(
      thumbColor: AppColors.black,
      thumbVisibility: true,
      thickness: 3.w,
      radius: Radius.circular(40.r),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 10,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedCountry = index;
              });
            },
            child: CountryItem(isSelected: selectedCountry == index),
          );
        },
      ),
    );
  }
}
