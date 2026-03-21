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

  static const api = '/api';

  static const homeEndPoint = "$api/home/get-home-data";
  static const place_by_category = "$api/home/by-category";
  static const place_by_city = "$api/home/by-city";
  static const ai_packages = "$api/home/ai-packages-suggestions";
  

}
