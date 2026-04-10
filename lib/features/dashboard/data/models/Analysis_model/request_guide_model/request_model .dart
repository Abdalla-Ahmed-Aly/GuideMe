import 'package:guide_me/features/dashboard/data/models/Analysis_model/request_guide_model/booking_request_card_model.dart';

class RequestModel {
  final String type;
  final BookingRequestModel booking;

  RequestModel({
    required this.type,
    required this.booking,
  });

  factory RequestModel.fromJson(Map<String, dynamic> json) {
    return RequestModel(
      type: json['type'],
      booking: BookingRequestModel.fromJson(json['booking']),
    );
  }
}