part of 'cancel_booking_cubit.dart';

abstract class CancelBookingState {}

final class CancelBookingInitial extends CancelBookingState {}

final class CancelBookingLoading extends CancelBookingState {}

final class CancelBookingSuccess extends CancelBookingState {}

final class CancelBookingFailure extends CancelBookingState {
  final Failure failure;
  CancelBookingFailure({required this.failure});
}
