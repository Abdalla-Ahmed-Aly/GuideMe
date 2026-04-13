part of 'accept_booking_cubit.dart';


sealed class AcceptBookingState {}

final class AcceptBookingInitial extends AcceptBookingState {}

final class AcceptBookingLoading extends AcceptBookingState {}
final class AcceptBookingSuccess extends AcceptBookingState {
  final String bookingId;

  AcceptBookingSuccess(this.bookingId);
}
final class AcceptBookingFailure extends AcceptBookingState {
  final String message;

  AcceptBookingFailure(this.message);
}

class DeclineBookingSuccess extends AcceptBookingState {
  final String bookingId;
  DeclineBookingSuccess(this.bookingId);
}