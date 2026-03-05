import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/functions/is_same_date.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/features/booking/presentation/cubits/booking_cubit/booking_cubit.dart';
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

  late DateTime? selectedDay;

  @override
  void initState() {
    super.initState();
    selectedDay = context.read<BookingCubit>().state.selectedDate;
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
      child: BlocBuilder<BookingCubit, BookingState>(
        builder: (context, state) {
          return Row(
            children: [
              AllChip(
                isSelected: selectedDay == null,
                onTap: () {
                  context.read<BookingCubit>().changeDate(null);
                  selectedDay = null;
                },
              ),

              ..._dates.map((date) {
                return DayChip(
                  date: date,
                  isSelected: isSameDate(selectedDay, date),
                  onTap: () {
                    context.read<BookingCubit>().changeDate(date);
                    selectedDay = date;
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
