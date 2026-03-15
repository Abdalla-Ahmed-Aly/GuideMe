import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/features/booking/domain/enums/tourist_booking_status.dart';
import 'package:guide_me/features/booking/presentation/cubits/tourist_booking_cubit/tourist_booking_cubit.dart';
import 'package:guide_me/features/guide_booking/presentation/widgets/guide_booking_status_filter.dart';

class TouristBookingStatusFilter extends StatelessWidget {
  const TouristBookingStatusFilter({super.key});

  @override
  Widget build(BuildContext context) {
    final status = [
      TouristBookingStatus.pending,
      TouristBookingStatus.live,
      TouristBookingStatus.completed,
    ];
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6),
      margin: EdgeInsets.symmetric(horizontal: 22.p),
      decoration: BoxDecoration(
        color: const Color(0xffF7EDDD),
        borderRadius: BorderRadius.circular(50),
      ),
      child: BlocBuilder<TouristBookingCubit, TouristBookingState>(
        builder: (context, state) {
          final selectedStatus = state.filters.touristBookingStatus;
          final selectedDate = state.filters.selectedDate;

          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: !isPastSelectedDate(selectedDate) || selectedDate == null
                ? status.map(
                    (status) {
                      return Expanded(
                        child: StatusChip(
                          isSelected: selectedStatus == status,
                          title: _getTitle(context, status),
                          onTap: () {
                            context
                                .read<TouristBookingCubit>()
                                .changeTouristBookingStatus(
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
                            .read<TouristBookingCubit>()
                            .changeTouristBookingStatus(
                              TouristBookingStatus.completed,
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

  String _getTitle(BuildContext context, TouristBookingStatus status) {
    switch (status) {
      case TouristBookingStatus.pending:
        return context.l10n.pending;
      case TouristBookingStatus.accepted:
        return context.l10n.accepted;
      case TouristBookingStatus.live:
        return context.l10n.live;
      case TouristBookingStatus.completed:
        return context.l10n.completed;
      case TouristBookingStatus.cancelled:
        return context.l10n.cancelled;
    }
  }
}
