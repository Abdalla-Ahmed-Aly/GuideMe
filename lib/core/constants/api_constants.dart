abstract class ApiConstants {
  static const String baseUrl = "https://guide-me-back-end.vercel.app";
  static const String apiVersion = "/api";

  static const String addBookingEndpoint = "$apiVersion/booking";
  static const String myScheduleEndpoint = "$addBookingEndpoint/my-schedule";
  static const String cancelBookingEndpoint = "/cancel";
}
