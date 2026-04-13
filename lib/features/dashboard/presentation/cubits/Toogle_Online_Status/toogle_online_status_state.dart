part of 'toogle_online_status_cubit.dart';

sealed class ToogleOnlineStatusState {}

final class ToogleOnlineStatusInitial extends ToogleOnlineStatusState {}

final class ToogleOnlineStatusLoading extends ToogleOnlineStatusState {}

final class ToogleOnlineStatusChanged extends ToogleOnlineStatusState {
  final bool isOnline;
  ToogleOnlineStatusChanged(this.isOnline);
}

final class ToogleOnlineStatusError extends ToogleOnlineStatusState {
  final String message;
  ToogleOnlineStatusError(this.message);
}
