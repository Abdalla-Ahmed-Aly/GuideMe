part of 'add_certification_cubit.dart';

sealed class AddCertificationState {}

final class AddCertificationInitial extends AddCertificationState {}

final class AddCertificationLoading extends AddCertificationState {}

final class AddCertificationSuccess extends AddCertificationState {
  final UserEntity user;
  AddCertificationSuccess({required this.user});
}

final class AddCertificationFailure extends AddCertificationState {
  final Failure failure;
  AddCertificationFailure({required this.failure});
}
