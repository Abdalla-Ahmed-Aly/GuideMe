abstract class ApiConstants {
  static const String baseUrl = "https://guide-me-back-end.vercel.app";
  static const String loginEndPoint = '/api/auth/login';
  static const String registerEndPoint = '/api/auth/register';
  static const String resendPasswordEndPoint =
      '/api/auth/forgot-password/resend-otp';
  static const String resetPasswordEndPoint =
      '/api/auth/forgot-password/reset-password';
  static const String sendForgetPasswordEndPoint =
      '/api/auth/forgot-password/send-otp';
  static const String verifyForgetPasswordEndPoint =
      '/api/auth/forgot-password/verify-otp';
  static const String loginWithGoogleEndPoint = '/api/auth/google-login';
}
