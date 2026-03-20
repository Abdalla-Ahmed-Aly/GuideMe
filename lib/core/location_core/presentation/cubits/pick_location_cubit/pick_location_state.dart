part of 'pick_location_cubit.dart';

sealed class PickLocationState {}

final class PickLocationInitial extends PickLocationState {}

final class PickLocationLoading extends PickLocationState {}

final class PickLocationSuccessLoading extends PickLocationState {
  final MapLocationEntity location;

  PickLocationSuccessLoading(this.location);
}

final class PickLocationSuccess extends PickLocationState {
  final MapLocationEntity location;
  final bool movedByGps;

  PickLocationSuccess(this.location, {this.movedByGps = false});
}

final class PickLocationFailure extends PickLocationState {
  final Failure failure;

  PickLocationFailure(this.failure);
}
