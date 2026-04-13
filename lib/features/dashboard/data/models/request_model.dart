import 'package:guide_me/features/booking/data/models/booking_model.dart';

class RequestModel {
  final String type;
  final String? packageId;
  final List<BookingModel>? bookings;
  final BookingModel? booking;

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
            ).map((e) => BookingModel.fromJson(e)).toList()
          : null,
      booking: json['booking'] != null
          ? BookingModel.fromJson(json['booking'])
          : null,
    );
  }
}
