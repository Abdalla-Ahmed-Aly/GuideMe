part of 'accept_package_cubit.dart';

sealed class PackageActionsState {}

final class PackageActionsInitial extends PackageActionsState {}

final class PackageActionsLoading extends PackageActionsState {
  final String packageId;
  PackageActionsLoading({required this.packageId});
}

final class PackageActionsSuccess extends PackageActionsState {
  final String packageId;
  PackageActionsSuccess({required this.packageId});
}

final class PackageActionsFailure extends PackageActionsState {
  final Failure failure;
  final String packageId;
  PackageActionsFailure({required this.failure, required this.packageId});
}
