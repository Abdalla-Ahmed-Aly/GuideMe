part of 'add_booking_cubit.dart';

abstract class AddBookingState {}

final class AddBookingInitial extends AddBookingState {}

final class AddBookingLoading extends AddBookingState {}

final class AddBookingSuccess extends AddBookingState {
  final BookingEntity booking;
  AddBookingSuccess(this.booking);
}

final class AddBookingError extends AddBookingState {
  final Failure failure;
  AddBookingError(this.failure);
}
