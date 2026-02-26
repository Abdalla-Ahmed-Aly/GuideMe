part of 'work_hours_cubit.dart';

class WorkHoursState {
  final TimeOfDay? from;
  final TimeOfDay? to;

  const WorkHoursState({
    this.from,
    this.to,
  });

  WorkHoursState copyWith({
    TimeOfDay? from,
    TimeOfDay? to,
  }) {
    return WorkHoursState(
      from: from ?? this.from,
      to: to ?? this.to,
    );
  }

  // bool get isValid {
  //   if (from == null || to == null) return false;

  //   final f = from!.hour * 60 + from!.minute;
  //   final t = to!.hour * 60 + to!.minute;
  //   return t > f;
  // }

  bool get isFromValid => from != null;

  bool get isToValid {
    if (to == null || from == null) return false;

    final f = from!.hour * 60 + from!.minute;
    final t = to!.hour * 60 + to!.minute;

    return t > f;
  }

  bool get isValid => isFromValid && isToValid;

}
