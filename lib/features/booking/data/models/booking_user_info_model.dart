import 'package:guide_me/features/booking/domain/entities/booking_user_info_entity.dart';

class BookingUserInfoModel {
  final String name;
  final String photo;
  final String location;
  final double lat;
  final double long;

  const BookingUserInfoModel({
    required this.name,
    required this.photo,
    required this.location,
    required this.lat,
    required this.long,
  });

  factory BookingUserInfoModel.fromJson(Map<String, dynamic> json) {
    return BookingUserInfoModel(
      name: json['name'],
      photo: json['photo'],
      location: json['location'],
      lat: (json['lat'] as num).toDouble(),
      long: (json['long'] as num).toDouble(),
    );
  }

  BookingUserInfoEntity toEntity() => BookingUserInfoEntity(
    name: name,
    photo: photo,
    location: location,
    lat: lat,
    long: long,
  );
}
