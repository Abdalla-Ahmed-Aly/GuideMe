part of 'reservation_cubit.dart';

class ReservationState {
  final String? placeId;
  final DateTime? date;
  final String? pickupLocation;
  final String notes;
  final int persons;
  final String? error;

  const ReservationState({
    this.placeId,
    this.date,
    this.pickupLocation,
    this.notes = '',
    this.persons = 1,
    this.error,
  });

  factory ReservationState.initial() => const ReservationState();

  ReservationState copyWith({
    String? placeId,
    DateTime? date,
    String? pickupLocation,
    String? notes,
    int? persons,
    String? error,
  }) => ReservationState(
    placeId: placeId ?? this.placeId,
    date: date ?? this.date,
    pickupLocation: pickupLocation ?? this.pickupLocation,
    notes: notes ?? this.notes,
    persons: persons ?? this.persons,
    error: error ?? this.error,
  );

  bool get dateIsValid =>
      date != null &&
      date!.isAfter(DateTime.now().subtract(const Duration(days: 1)));

  bool get isAllDataFilled =>
      placeId != null &&
      dateIsValid &&
      pickupLocation != null &&
      pickupLocation!.isNotEmpty &&
      notes.isNotEmpty &&
      persons > 0;
}
