part of 'booking_cubit.dart';

class BookingState {
  DateTime? selectedDate;
  late TouristTripStatus touristTirpStatus;
  late GuideTripStatus guideTripStatus;

  BookingState({
    this.selectedDate,
    required this.touristTirpStatus,
    required this.guideTripStatus,
  });

  BookingState.initial() {
    selectedDate = DateTime.now();
    touristTirpStatus = TouristTripStatus.live;
    guideTripStatus = GuideTripStatus.live;
  }

  BookingState copyWith({
    DateTime? selectedDate,
    TouristTripStatus? touristTirpStatus,
    GuideTripStatus? guideTripStatus,
  }) {
    return BookingState(
      selectedDate: selectedDate ?? this.selectedDate,
      touristTirpStatus: touristTirpStatus ?? this.touristTirpStatus,
      guideTripStatus: guideTripStatus ?? this.guideTripStatus,
    );
  }
}
