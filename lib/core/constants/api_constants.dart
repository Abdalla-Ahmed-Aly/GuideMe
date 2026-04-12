abstract class ApiConstants {
  // base
  static const String baseUrl = "https://guideme-pjss.onrender.com";
  static const String otpBaseUrl = "https://guide-me-back-end.vercel.app";
  static const api = '/api';

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
  static const String addNationalityEndPoint = '$api/home/nationality';

  static const homeEndPoint = "$api/home/get-home-data";
  static const placeByCategory = "$api/home/by-category";
  static const placeByCity = "$api/home/by-city";
  static const aiPackages = "$api/home/ai-packages-suggestions";
  static const getcatogey = '$api/category';
  static const addInterests = '$api/home/interests';
  static const locationEndPoint = '$api/profile/location';
  static const profile = '$api/profile';

  static const String addBookingEndpoint = "$api/booking";
  static const String myScheduleEndpoint = "$addBookingEndpoint/my-schedule";
  static const String cancelBookingEndpoint = "/cancel";
  static const String citiesEndpoint = "$addBookingEndpoint/get-cities";
  static const String suggestionsEndpoint = "$addBookingEndpoint/suggestions";
  static const String bookPackageEndpoint = "$addBookingEndpoint/book";
  static const String userProfileEndpoint = "$api/home/profile";
  static const String bookAiPackageEndpoint = "$api/booking/book-ai";
  // Guide booking track
  static const String guideScheduleEndpoint = "$api/Guide_Dashboard/schedule";
  static const String guideBooking = "$api/Guide_Dashboard/booking";
  static const String startTour = "/start";
  static const String endTour = "/end";



  static const String onboarding = "$api/guide/onboarding";
  static const String guideVerificationStatus = "$api/guide/onboarding/verification-status";

}
