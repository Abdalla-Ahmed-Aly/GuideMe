part of 'dashboard_cubit.dart';

sealed class DashboardCubitState {}

final class DashboardCubitInitial extends DashboardCubitState {}

final class DashboardCubitLoading extends DashboardCubitState {}

final class DashboardCubitSuccess extends DashboardCubitState {
  final List<RequestEntity> requestsHistory;
  DashboardCubitSuccess(this.requestsHistory);
}

final class DashboardCubitFailure extends DashboardCubitState {
  final Failure failure;

  DashboardCubitFailure(this.failure);
}
