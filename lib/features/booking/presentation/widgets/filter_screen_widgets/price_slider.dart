import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/features/booking/presentation/cubits/filter_cubit/filter_cubit.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class PriceSlider extends StatelessWidget {
  const PriceSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final Widget thumb = Container(
      width: 20.w,
      height: 20.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.primary2, width: 2),
      ),
    );

    return BlocBuilder<FilterCubit, FilterState>(
      builder: (context, state) {
        final priceRange = state.filters.priceRange;
        return SfRangeSlider(
          values: SfRangeValues(priceRange.start, priceRange.end),
          interval: 200,
          activeColor: AppColors.yellow,
          inactiveColor: const Color(0xffE2E8F0),
          min: 0,
          max: 1000,
          startThumbIcon: thumb,
          endThumbIcon: thumb,
          onChanged: (SfRangeValues value) {
            context.read<FilterCubit>().setPriceRange(
              RangeValues(value.start, value.end),
            );
          },
        );
      },
    );
  }
}
