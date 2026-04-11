import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/guide_registration/presentation/cubits/guide_registration_shared_cubit/guide_registration_shared_cubit.dart';
import 'package:guide_me/features/guide_registration/presentation/cubits/guide_registration_shared_cubit/guide_registration_shared_state.dart';

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

          BlocBuilder<GuideRegistrationSharedCubit, GuideRegistrationSharedState>(
            builder: (context, state) {
              final cubit = context.read<GuideRegistrationSharedCubit>();
              String fromTime = "09:00";
              String toTime = "17:00";
              
              if (state is GuideRegistrationFormData) {
                fromTime = state.model.availability.from;
                toTime = state.model.availability.to;
              }

              TimeOfDay _parse(String time) {
                final parts = time.split(':');
                if (parts.length != 2) return const TimeOfDay(hour: 9, minute: 0);
                return TimeOfDay(hour: int.tryParse(parts[0]) ?? 9, minute: int.tryParse(parts[1]) ?? 0);
              }

              String _format(TimeOfDay time) {
                final hh = time.hour.toString().padLeft(2, '0');
                final mm = time.minute.toString().padLeft(2, '0');
                return "$hh:$mm";
              }

              final fromTod = _parse(fromTime);
              final toTod = _parse(toTime);

              return Row(
                children: [
                  // From
                  _buildTimePicker(
                    label: context.l10n.from,
                    context: context,
                    isCompleted: true,
                    onTap: () async {
                      final picked = await showTimePicker(
                        context: context,
                        initialTime: fromTod,
                      );

                      if (picked != null) {
                        cubit.setAvailability(from: _format(picked));
                      }
                    },
                    time: fromTime,
                  ),

                  const SizedBox(width: 16),

                  // to
                  _buildTimePicker(
                    label: context.l10n.to,
                    context: context,
                    isCompleted: true,
                    onTap: () async {
                      final picked = await showTimePicker(
                        context: context,
                        initialTime: toTod,
                      );

                      if (picked != null) {
                        cubit.setAvailability(to: _format(picked));
                      }
                    },
                    time: toTime,
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
