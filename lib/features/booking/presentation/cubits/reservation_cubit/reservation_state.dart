part of 'reservation_cubit.dart';

class ReservationState {
  final String placeId;
  final String date;
  final TimeOfDay time;
  final String pickupLocation;
  final String notes;
  final int persons;
  final String? error;

  const ReservationState({
    this.placeId = '6980e0457c8a319e4685b63d',
    this.date = '',
    this.time = const TimeOfDay(hour: 0, minute: 0),
    this.pickupLocation = '123 Main St',
    this.notes = '',
    this.persons = 1,
    this.error,
  });

  factory ReservationState.initial() => const ReservationState();

  ReservationState copyWith({
    String? placeId,
    String? date,
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

  List<Object> get props => [
    placeId,
    date,
    time,
    pickupLocation,
    notes,
    persons,
  ];

  String get timeFormatted =>
      '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
}
