import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/features/booking/presentation/cubits/reservation_cubit/reservation_cubit.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class PeopleSlider extends StatelessWidget {
  const PeopleSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final Widget startThumbIcon = Container(
      height: 28,
      width: 28,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.yellow,
        border: Border.all(
          color: AppColors.natural2,
          width: 3,
        ),
      ),
    );
    return BlocBuilder<ReservationCubit, ReservationState>(
      builder: (context, state) {
        return SfSlider(
          value: state.persons.toDouble(),
          min: 1,
          max: 10,
          showTicks: true,
          showLabels: true,
          activeColor: AppColors.yellow,
          inactiveColor: AppColors.natural2,
          thumbIcon: startThumbIcon,
          enableTooltip: true,
          tooltipTextFormatterCallback:
              (dynamic actualValue, String formattedText) {
                return ' Person ${actualValue.round()} ';
              },

          onChanged: (value) {
            context.read<ReservationCubit>().setPersons(value.toInt());
          },
        );
      },
    );
  }
}
