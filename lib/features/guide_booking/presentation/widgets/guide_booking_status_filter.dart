import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/booking/domain/enums/guide_booking_status.dart';
import 'package:guide_me/features/guide_booking/presentation/cubits/guide_booking_cubit/guide_booking_cubit.dart';

class GuideBookingStatusFilter extends StatelessWidget {
  const GuideBookingStatusFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6),
      margin: EdgeInsets.symmetric(horizontal: 22.p),
      decoration: BoxDecoration(
        color: const Color(0xffF7EDDD),
        borderRadius: BorderRadius.circular(50),
      ),
      child: BlocBuilder<GuideBookingCubit, GuideBookingState>(
        builder: (context, state) {
          final selectedStatus = state.guideBookingStatus;
          final selectedDate = state.selectedDate;

          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: !isPastSelectedDate(selectedDate)
                ? GuideBookingStatus.values.map(
                    (status) {
                      return Expanded(
                        child: StatusChip(
                          isSelected: selectedStatus == status,
                          title: _getTitle(context, status),
                          onTap: () {
                            context
                                .read<GuideBookingCubit>()
                                .changeGuideBookingStatus(
                                  status,
                                );
                          },
                        ),
                      );
                    },
                  ).toList()
                : [
                    StatusChip(
                      isSelected: true,
                      title: context.l10n.completed,
                      onTap: () {
                        context
                            .read<GuideBookingCubit>()
                            .changeGuideBookingStatus(
                              GuideBookingStatus.completed,
                            );
                      },
                    ),
                  ],
          );
        },
      ),
    );
  }

  bool isPastSelectedDate(DateTime? selectedDate) {
    if (selectedDate == null) return false;

    final today = DateTime.now();
    final pureToday = DateTime(today.year, today.month, today.day);

    return selectedDate.isBefore(pureToday);
  }

  String _getTitle(BuildContext context, GuideBookingStatus status) {
    switch (status) {
      case GuideBookingStatus.next:
        return context.l10n.next;
      case GuideBookingStatus.live:
        return context.l10n.live;
      case GuideBookingStatus.completed:
        return context.l10n.completed;
    }
  }
}

class StatusChip extends StatelessWidget {
  const StatusChip({
    super.key,
    required this.isSelected,
    required this.title,
    this.onTap,
  });
  final bool isSelected;
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedScale(
        duration: const Duration(milliseconds: 300),
        scale: isSelected ? 1.05 : 1,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 8),
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Text(
              title,
              style: AppTextStyles.poppinsMedium16.copyWith(
                color: isSelected
                    ? const Color(0xffF2930D)
                    : const Color(0xffB59A64),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
