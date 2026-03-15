import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/functions/is_same_date.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/features/booking/presentation/cubits/tourist_booking_cubit/tourist_booking_cubit.dart';
import 'package:guide_me/core/widgets/all_chip.dart';
import 'package:guide_me/core/widgets/day_chip.dart';

class ScheduleList extends StatefulWidget {
  const ScheduleList({super.key});

  @override
  State<ScheduleList> createState() => _ScheduleListState();
}

class _ScheduleListState extends State<ScheduleList> {
  final today = DateTime.now();
  final startedDate = DateTime.now().subtract(const Duration(days: 2));
  final endDate = DateTime.now().add(const Duration(days: 7));
  late List<DateTime> _dates;

  @override
  void initState() {
    super.initState();
    _generateDaysList();
  }

  void _generateDaysList() {
    _dates = List.generate(
      endDate.difference(startedDate).inDays + 1,
      (index) => startedDate.add(Duration(days: index)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 17.p),
      child: BlocBuilder<TouristBookingCubit, TouristBookingState>(
        builder: (context, state) {
          return Row(
            children: [
              AllChip(
                isSelected: state.filters.selectedDate == null,
                onTap: () {
                  context.read<TouristBookingCubit>().changeDate(null);
                },
              ),

              ..._dates.map((date) {
                return DayChip(
                  date: date,
                  isSelected: isSameDate(state.filters.selectedDate, date),
                  onTap: () {
                    context.read<TouristBookingCubit>().changeDate(date);
                  },
                );
              }),
            ],
          );
        },
      ),
    );
  }
}
