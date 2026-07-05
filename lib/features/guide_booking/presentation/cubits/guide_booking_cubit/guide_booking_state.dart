part of 'guide_booking_cubit.dart';

class GuideBookingFilters {
  DateTime? selectedDate;
  late GuideBookingStatus guideBookingStatus;
  late List<BookingEntity> guideBookings;

  GuideBookingFilters({
    this.selectedDate,
    required this.guideBookingStatus,
    required this.guideBookings,
  });

  GuideBookingFilters.initial() {
    selectedDate = DateTime.now();
    guideBookingStatus = GuideBookingStatus.live;
    guideBookings = [];
  }

  GuideBookingFilters copyWith({
    DateTime? selectedDate,
    bool clearDate = false,
    GuideBookingStatus? guideBookingStatus,
    List<BookingEntity>? guideBookings,
  }) {
    return GuideBookingFilters(
      selectedDate: clearDate ? null : selectedDate ?? this.selectedDate,
      guideBookingStatus: guideBookingStatus ?? this.guideBookingStatus,
      guideBookings: guideBookings ?? this.guideBookings,
    );
  }
}

abstract class GuideBookingState {
  final GuideBookingFilters filters;

  const GuideBookingState({required this.filters});

  GuideBookingState copyWith({GuideBookingFilters? filters});
}

class GuideBookingInitial extends GuideBookingState {
  GuideBookingInitial({GuideBookingFilters? filters})
      : super(filters: filters ?? GuideBookingFilters.initial());

  @override
  GuideBookingState copyWith({GuideBookingFilters? filters}) {
    return GuideBookingInitial(filters: filters);
  }
}

class GuideBookingLoading extends GuideBookingState {
  const GuideBookingLoading({required super.filters});

  @override
  GuideBookingState copyWith({GuideBookingFilters? filters}) {
    return GuideBookingLoading(filters: filters ?? this.filters);
  }
}

class GuideBookingSuccess extends GuideBookingState {
  final List<BookingEntity> guideBookings;

  const GuideBookingSuccess({
    required this.guideBookings,
    required super.filters,
  });

  @override
  GuideBookingState copyWith({GuideBookingFilters? filters}) {
    return GuideBookingSuccess(
      guideBookings: guideBookings,
      filters: filters ?? this.filters,
    );
  }
}

class GuideBookingFailure extends GuideBookingState {
  final Failure failure;

  const GuideBookingFailure({required this.failure, required super.filters});

  @override
  GuideBookingState copyWith({GuideBookingFilters? filters}) {
    return GuideBookingFailure(
      failure: failure,
      filters: filters ?? this.filters,
    );
  }
}
