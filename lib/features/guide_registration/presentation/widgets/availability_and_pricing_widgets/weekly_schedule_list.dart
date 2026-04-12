import 'package:flutter/material.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/features/guide_registration/presentation/cubits/guide_registration_shared_cubit/guide_registration_shared_cubit.dart';
import 'package:guide_me/features/guide_registration/presentation/cubits/guide_registration_shared_cubit/guide_registration_shared_state.dart';

class WeeklyScheduleList extends StatelessWidget {
  const WeeklyScheduleList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> days = [
      "Mon",
      "Tue",
      "Wed",
      "Thu",
      "Fri",
      "Sat",
      "Sun",
    ];

    return BlocBuilder<GuideRegistrationSharedCubit, GuideRegistrationSharedState>(
      builder: (context, state) {
        List<String> selectedDays = [];
        if (state is GuideRegistrationFormData) {
          selectedDays = state.model.availability.days;
        }
        return ListView.separated(
          clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
          itemCount: 7,
          separatorBuilder: (context, index) {
            return const SizedBox(width: 6);
          },
          itemBuilder: (context, index) {
            final isSelected = selectedDays.contains(days[index]);
            return GestureDetector(
              onTap: () {
                context.read<GuideRegistrationSharedCubit>().toggleAvailabilityDay(days[index]);
              },
              child: AnimatedContainer(
                width: 70.w,
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xffF2930D) : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: isSelected
                      ? null
                      : Border.all(color: const Color(0xffE5E5E5)),
                ),
                child: Center(
                  child: Text(
                    days[index],
                    style: AppTextStyles.poppinsMedium16.copyWith(
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
