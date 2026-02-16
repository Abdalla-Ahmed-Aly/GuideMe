part of 'booking_cubit.dart';

sealed class BookingState {}

final class BookingInitial extends BookingState {}

final class BookingChangeStatus extends BookingState {}

final class BookingChangeDate extends BookingState {}
