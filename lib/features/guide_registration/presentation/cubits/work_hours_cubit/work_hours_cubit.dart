
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'work_hours_state.dart';

class WorkHoursCubit extends Cubit<WorkHoursState> {
  WorkHoursCubit() : super(const WorkHoursState());

  void updateFrom(TimeOfDay value) {
    emit(state.copyWith(from: value));
  }

  void updateTo(TimeOfDay value) {
    emit(state.copyWith(to: value));
  }

  String format(TimeOfDay time) {
    final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.period == DayPeriod.am ? "AM" : "PM";
    return "$hour:$minute $period";
  }
}


