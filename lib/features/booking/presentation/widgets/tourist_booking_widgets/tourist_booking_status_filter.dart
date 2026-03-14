import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/features/booking/domain/enums/tourist_trip_status.dart';
import 'package:guide_me/features/booking/presentation/cubits/booking_cubit/booking_cubit.dart';
import 'package:guide_me/features/guide_booking/presentation/widgets/guide_booking_status_filter.dart';

class TouristBookingStatusFilter extends StatelessWidget {
  const TouristBookingStatusFilter({super.key});

  @override
  Widget build(BuildContext context) {
    final status = [
      BookingStatus.pending,
      BookingStatus.live,
      BookingStatus.completed,
    ];
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6),
      margin: EdgeInsets.symmetric(horizontal: 22.p),
      decoration: BoxDecoration(
        color: const Color(0xffF7EDDD),
        borderRadius: BorderRadius.circular(50),
      ),
      child: BlocBuilder<BookingCubit, BookingState>(
        builder: (context, state) {
          final selectedStatus = state.touristTirpStatus;
          final selectedDate = state.selectedDate;

          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: !isPastSelectedDate(selectedDate)
                ? status.map(
                    (status) {
                      return Expanded(
                        child: StatusChip(
                          isSelected: selectedStatus == status,
                          title: _getTitle(context, status),
                          onTap: () {
                            context
                                .read<BookingCubit>()
                                .changeTouristTripStatus(
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
                        context.read<BookingCubit>().changeTouristTripStatus(
                          BookingStatus.completed,
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

  String _getTitle(BuildContext context, BookingStatus status) {
    switch (status) {
      case BookingStatus.pending:
        return context.l10n.pending;
      case BookingStatus.accepted:
        return context.l10n.accepted;
      case BookingStatus.live:
        return context.l10n.live;
      case BookingStatus.completed:
        return context.l10n.completed;
      case BookingStatus.cancelled:
        return context.l10n.cancelled;
    }
  }
}
