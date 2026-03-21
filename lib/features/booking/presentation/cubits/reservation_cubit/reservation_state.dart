part of 'reservation_cubit.dart';

class ReservationState {
  final String placeId;
  final DateTime? date;
  final TimeOfDay? time;
  final String? pickupLocation;
  final String notes;
  final int persons;
  final String? error;

  const ReservationState({
    this.placeId = '6980e0457c8a319e4685b63d',
    this.date,
    this.time,
    this.pickupLocation,
    this.notes = '',
    this.persons = 1,
    this.error,
  });

  factory ReservationState.initial() => const ReservationState();

  ReservationState copyWith({
    String? placeId,
    DateTime? date,
    TimeOfDay? time,
    String? pickupLocation,
    String? notes,
    int? persons,
    String? error,
  }) => ReservationState(
    placeId: placeId ?? this.placeId,
    date: date ?? this.date,
    time: time ?? this.time,
    pickupLocation: pickupLocation ?? this.pickupLocation,
    notes: notes ?? this.notes,
    persons: persons ?? this.persons,
    error: error ?? this.error,
  );

  String get timeFormatted =>
      '${time?.hour.toString().padLeft(2, '0')}:${time?.minute.toString().padLeft(2, '0')}';

  bool get dateIsValid =>
      date != null &&
      date!.isAfter(DateTime.now().subtract(const Duration(days: 1)));

  bool get timeIsValid {
    if (time == null || date == null) return false;
    final selected = DateTime(
      date!.year,
      date!.month,
      date!.day,
      time!.hour,
      time!.minute,
    );
    return DateTime.now().isBefore(selected);
  }

  bool get isAllDataFilled =>
      dateIsValid &&
      timeIsValid &&
      pickupLocation != null &&
      pickupLocation!.isNotEmpty &&
      notes.isNotEmpty &&
      persons > 0;
}
