import 'package:flutter/material.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class WeeklyScheduleList extends StatefulWidget {
  const WeeklyScheduleList({super.key});

  @override
  State<WeeklyScheduleList> createState() => _WeeklyScheduleListState();
}

class _WeeklyScheduleListState extends State<WeeklyScheduleList> {
  final List<String> days = [
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
    "Sun",
  ];

  List<String> selectedDays = [];

  @override
  Widget build(BuildContext context) {
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
            setState(() {
              if (isSelected) {
                selectedDays.remove(days[index]);
              } else {
                selectedDays.add(days[index]);
              }
            });
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
  }
}
