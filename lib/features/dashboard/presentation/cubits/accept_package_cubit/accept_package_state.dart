part of 'accept_package_cubit.dart';

sealed class AcceptPackageState {}

final class AcceptPackageInitial extends AcceptPackageState {}

final class AcceptPackageLoading extends AcceptPackageState {
  final String packageId;
  AcceptPackageLoading({required this.packageId});
}

final class AcceptPackageSuccess extends AcceptPackageState {
  final String packageId;
  AcceptPackageSuccess({required this.packageId});
}

final class AcceptPackageFailure extends AcceptPackageState {
  final Failure failure;
  final String packageId;
  AcceptPackageFailure({required this.failure, required this.packageId});
}
