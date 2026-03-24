part of 'splash_cubit.dart';

sealed class SplashState {}

final class SplashInitial extends SplashState {}

final class SplashAuthenticated extends SplashState {
  final UserRole userRole;
  SplashAuthenticated({required this.userRole});
}

final class SplashUnAuthenticated extends SplashState {}
