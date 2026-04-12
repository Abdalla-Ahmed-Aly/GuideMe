import 'package:guide_me/features/dashboard/data/models/Analysis_model/request_guide_model/booking_request_model.dart';

class RequestModel {
  final String type;
  final String? packageId;
  final List<BookingRequestModel>? bookings;
  final BookingRequestModel? booking;

  RequestModel({
    required this.type,
    this.packageId,
    this.bookings,
    this.booking,
  });

  factory RequestModel.fromJson(Map<String, dynamic> json) {
    return RequestModel(
      type: json['type'],
      packageId: json['packageId'],
      bookings: json['bookings'] != null
          ? List.from(
              json['bookings'],
            ).map((e) => BookingRequestModel.fromJson(e)).toList()
          : null,
      booking: json['booking'] != null
          ? BookingRequestModel.fromJson(json['booking'])
          : null,
    );
  }
}
