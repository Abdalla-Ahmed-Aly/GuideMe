import 'package:flutter/material.dart';
import 'package:guide_me/core/functions/is_same_date.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/features/booking/presentation/widgets/booking_widgets/all_chip.dart';
import 'package:guide_me/features/booking/presentation/widgets/booking_widgets/day_chip.dart';

class ScheduleListView extends StatefulWidget {
  const ScheduleListView({super.key});

  @override
  State<ScheduleListView> createState() => _ScheduleListViewState();
}

class _ScheduleListViewState extends State<ScheduleListView> {
  final today = DateTime.now();
  final startedDate = DateTime.now().subtract(const Duration(days: 2));
  final endDate = DateTime.now().add(const Duration(days: 7));
  late List<DateTime> _dates;

  late DateTime? selectedDay;

  @override
  void initState() {
    super.initState();
    selectedDay = today;
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
      child: Row(
        children: [
          AllChip(
            isSelected: selectedDay == null,
            onTap: () {
              setState(() {
                selectedDay = null;
              });
            },
          ),

          ..._dates.map((date) {
            return DayChip(
              date: date,
              isSelected: isSameDate(selectedDay, date),
              onTap: () {
                setState(() {
                  selectedDay = date;
                });
              },
            );
          }),
        ],
      ),
    );
  }
}
