import 'package:guide_me/features/booking/domain/entities/booking_entity.dart';

import 'booking_place_info_model.dart';
import 'booking_user_info_model.dart';

class BookingModel {
  final String id;
  final String user;
  final String place;
  final String startTime;
  final String endTime;
  final int persons;
  final double totalPrice;
  final String status;
  final BookingUserInfoModel userInfo;
  final BookingPlaceInfoModel placeInfo;

  const BookingModel({
    required this.id,
    required this.user,
    required this.place,
    required this.startTime,
    required this.endTime,
    required this.persons,
    required this.totalPrice,
    required this.status,
    required this.userInfo,
    required this.placeInfo,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
    id: json['_id'],
    user: json['user'],
    place: json['place'],
    startTime: json['startTime'],
    endTime: json['endTime'],
    persons: json['persons'],
    totalPrice: (json['totalPrice'] as num).toDouble(),
    status: json['status'],
    userInfo: BookingUserInfoModel.fromJson(json['userInfo']),
    placeInfo: BookingPlaceInfoModel.fromJson(json['placeInfo']),
  );

  BookingEntity toEntity() => BookingEntity(
    id: id,
    user: user,
    place: place,
    startTime: DateTime.parse(startTime),
    endTime: DateTime.parse(endTime),
    persons: persons,
    totalPrice: totalPrice,
    status: status,
    userInfo: userInfo.toEntity(),
    placeInfo: placeInfo.toEntity(),
  );
}
