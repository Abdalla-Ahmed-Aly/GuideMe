part of 'location_access_cubit.dart';

sealed class LocationAccessState {}

final class LocationAccessInitial extends LocationAccessState {}

final class LocationAccessLoading extends LocationAccessState {}

final class LocationAccessSuccess extends LocationAccessState {}

final class LocationAccessFailure extends LocationAccessState {
  final Failure failure;

  LocationAccessFailure(this.failure);
}
