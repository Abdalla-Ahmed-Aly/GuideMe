import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/booking/presentation/cubits/filter_cubit/filter_cubit.dart';

class CitySelectionWrap extends StatelessWidget {
  const CitySelectionWrap({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterCubit, FilterState>(
      builder: (context, state) {
        return Wrap(
          spacing: 12,
          children: state.filters.availableCities.map((city) {
            return ChoiceChip(
              label: Text(city.name),
              selected: state.filters.city?.id == city.id,
              showCheckmark: false,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              selectedColor: AppColors.primary2,
              labelStyle: AppTextStyles.poppinsMedium14.copyWith(
                color: state.filters.city?.id == city.id
                    ? Colors.white
                    : Colors.black,
              ),
              backgroundColor: Colors.white,
              onSelected: (value) {
                context.read<FilterCubit>().setCity(city);
              },
            );
          }).toList(),
        );
      },
    );
  }
}
