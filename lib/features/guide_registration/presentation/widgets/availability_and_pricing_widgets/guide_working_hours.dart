import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/guide_registration/presentation/cubits/work_hours_cubit/work_hours_cubit.dart';

class GuideWorkingHours extends StatelessWidget {
  const GuideWorkingHours({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xffDEDEDE)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                  color: const Color(0xffF2930D),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                context.l10n.workHoursForSelectedDays,
                style: AppTextStyles.poppinsMedium16,
              ),
            ],
          ),
          const SizedBox(height: 22),

          BlocBuilder<WorkHoursCubit, WorkHoursState>(
            builder: (context, state) {
              final cubit = context.read<WorkHoursCubit>();
              return Row(
                children: [
                  // From
                  _buildTimePicker(
                    label: context.l10n.from,
                    context: context,
                    isCompleted: state.isFromValid,
                    onTap: () async {
                      final picked = await showTimePicker(
                        context: context,
                        initialTime:
                            state.from ?? const TimeOfDay(hour: 9, minute: 0),
                      );

                      if (picked != null) {
                        cubit.updateFrom(picked);
                      }
                    },
                    time: state.from == null
                        ? context.l10n.selectTime
                        : cubit.format(state.from!),
                  ),

                  const SizedBox(width: 16),

                  // to
                  _buildTimePicker(
                    label: context.l10n.to,
                    context: context,
                    isCompleted: state.isToValid,
                    onTap: () async {
                      final picked = await showTimePicker(
                        context: context,
                        initialTime:
                            state.to ?? const TimeOfDay(hour: 17, minute: 0),
                      );

                      if (picked != null) {
                        cubit.updateTo(picked);
                      }
                    },
                    time: state.to == null
                        ? context.l10n.selectTime
                        : cubit.format(state.to!),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTimePicker({
    required BuildContext context,
    required bool isCompleted,
    required void Function()? onTap,
    required String time,
    required String label,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          decoration: BoxDecoration(
            color: isCompleted
                ? const Color(0xffF2930D).withValues(alpha: .15)
                : Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: isCompleted
                  ? const Color(0xffF2930D)
                  : const Color(0xffDEDEDE),
              width: isCompleted ? 2 : 1,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: AppTextStyles.poppinsMedium16.copyWith(
                      color: const Color(0xffF2930D),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    time,
                    style: AppTextStyles.poppinsMedium16.copyWith(
                      color: const Color(0xffF2930D),
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.access_time_filled,
                color: isCompleted ? const Color(0xffF2930D) : Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
