import 'package:guide_me/core/shared/models/place_model.dart';
import 'package:guide_me/features/dashboard/data/models/Analysis_model/request_guide_model/user_inforamtion_model.dart';

class BookingRequestModel {
  final String id;
  final UserInforamtionModel user;
  final PlaceModel place;
  final DateTime bookingDate;
  final int persons;
  final double totalPrice;
  final String status;

  BookingRequestModel({
    required this.id,
    required this.user,
    required this.place,
    required this.bookingDate,
    required this.persons,
    required this.totalPrice,
    required this.status,
  });

  factory BookingRequestModel.fromJson(Map<String, dynamic> json) {
    return BookingRequestModel(
      id: json['_id'],
      user: UserInforamtionModel.fromJson(json['user']),
      place: PlaceModel.fromJson(json['place']),
      bookingDate: DateTime.parse(json['bookingDate']),
      persons: json['persons'],
      totalPrice: json['totalPrice'],
      status: json['status'],
    );
  }
}