part of 'guide_booking_cubit.dart';

class GuideBookingState {
  DateTime? selectedDate;
  late GuideBookingStatus guideBookingStatus;

  GuideBookingState({
    this.selectedDate,
    required this.guideBookingStatus,
  });

  GuideBookingState.initial() {
    selectedDate = DateTime.now();
    guideBookingStatus = GuideBookingStatus.live;
  }

  GuideBookingState copyWith({
    DateTime? selectedDate,
    GuideBookingStatus? guideBookingStatus,
  }) {
    return GuideBookingState(
      selectedDate: selectedDate ?? this.selectedDate,
      guideBookingStatus: guideBookingStatus ?? this.guideBookingStatus,
    );
  }
}
