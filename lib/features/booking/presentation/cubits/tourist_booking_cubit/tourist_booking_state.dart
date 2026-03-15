part of 'tourist_booking_cubit.dart';

class TouristBookingFilters {
  DateTime? selectedDate;
  late TouristBookingStatus touristBookingStatus;

  TouristBookingFilters({
    this.selectedDate,
    required this.touristBookingStatus,
  });

  TouristBookingFilters.initial() {
    selectedDate = DateTime.now();
    touristBookingStatus = TouristBookingStatus.live;
  }

  TouristBookingFilters copyWith({
    DateTime? selectedDate,
    bool clearDate = false,
    TouristBookingStatus? touristTirpStatus,
  }) {
    return TouristBookingFilters(
      selectedDate: clearDate ? null : selectedDate ?? this.selectedDate,
      touristBookingStatus: touristTirpStatus ?? touristBookingStatus,
    );
  }
}

abstract class TouristBookingState {
  final TouristBookingFilters filters;

  const TouristBookingState({required this.filters});
}

class TouristBookingInitial extends TouristBookingState {
  TouristBookingInitial() : super(filters: TouristBookingFilters.initial());
}

class TouristBookingLoading extends TouristBookingState {
  const TouristBookingLoading({required super.filters});
}

class TouristBookingSuccess extends TouristBookingState {
  final List<BookingEntity> touristBookings;

  const TouristBookingSuccess({
    required this.touristBookings,
    required super.filters,
  });
}

class TouristBookingFailure extends TouristBookingState {
  final Failure failure;

  const TouristBookingFailure({required this.failure, required super.filters});
}
