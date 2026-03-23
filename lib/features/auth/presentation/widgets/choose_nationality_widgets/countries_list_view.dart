import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/features/auth/presentation/manager/select_nationality_cubit/select_nationality_cubit.dart';
import 'package:guide_me/features/auth/presentation/widgets/choose_nationality_widgets/country_item.dart';

class CountriesListView extends StatelessWidget {
  const CountriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return RawScrollbar(
      thumbColor: AppColors.black,
      thumbVisibility: true,
      thickness: 3.w,
      radius: Radius.circular(40.r),
      child: BlocBuilder<SelectNationalityCubit, SelectNationalityState>(
        builder: (context, state) {
          if (state.data.filteredNationalities.isNotEmpty) {
            return ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: state.data.filteredNationalities.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    context.read<SelectNationalityCubit>().selectNationality(
                      state.data.filteredNationalities[index],
                    );
                  },
                  child: CountryItem(
                    country: state.data.filteredNationalities[index],
                    isSelected:
                        state.data.selectedNationality ==
                        state.data.filteredNationalities[index],
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Text(context.l10n.noCountriesFound),
            );
          }
        },
      ),
    );
  }
}
