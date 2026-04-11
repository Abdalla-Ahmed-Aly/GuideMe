part of 'splash_cubit.dart';

sealed class SplashState {}

final class SplashInitial extends SplashState {}

final class SplashAuthenticated extends SplashState {
  final UserRole userRole;
  SplashAuthenticated({required this.userRole});
}

final class SplashUnAuthenticated extends SplashState {}

final class SplashGuideOnboardingPending extends SplashState {}
final class SplashGuideOnboardingApproved extends SplashState {}
final class SplashGuideOnboardingRejected extends SplashState {
  final String? reason;
  SplashGuideOnboardingRejected(this.reason);
}
final class SplashGuideOnboardingNotSubmitted extends SplashState {}
