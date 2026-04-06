part of 'guide_booking_actions_cubit.dart';

sealed class GuideBookingActionsState {}

final class GuideBookingActionsInitial extends GuideBookingActionsState {}

final class GuideBookingActionsLoading extends GuideBookingActionsState {
  final String bookingId;
  GuideBookingActionsLoading({required this.bookingId});
}

final class GuideBookingActionsSuccess extends GuideBookingActionsState {
  final String bookingId;
  GuideBookingActionsSuccess(this.bookingId);
}

final class GuideBookingActionsFailure extends GuideBookingActionsState {
  final String bookingId;
  final Failure failure;
  GuideBookingActionsFailure({required this.failure, required this.bookingId});
}
