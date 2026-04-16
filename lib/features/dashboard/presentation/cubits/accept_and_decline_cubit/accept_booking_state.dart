part of 'accept_booking_cubit.dart';

sealed class AcceptBookingState {}

final class AcceptBookingInitial extends AcceptBookingState {}

final class AcceptBookingLoading extends AcceptBookingState {
  final String bookingId;
  final bool isAccept;
  final bool isDecline;

  AcceptBookingLoading(
    this.bookingId, {
    this.isAccept = false,
    this.isDecline = false,
  });
}

final class AcceptBookingSuccess extends AcceptBookingState {
  final String bookingId;

  AcceptBookingSuccess(this.bookingId);
}

final class AcceptBookingFailure extends AcceptBookingState {
  final Failure failure;
  final String bookingId;

  AcceptBookingFailure(this.failure, this.bookingId);
}

class DeclineBookingSuccess extends AcceptBookingState {
  final String bookingId;
  DeclineBookingSuccess(this.bookingId);
}
