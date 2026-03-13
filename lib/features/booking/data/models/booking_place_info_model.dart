import 'package:guide_me/features/booking/domain/entities/booking_place_info_entity.dart';

class BookingPlaceInfoModel {
  final String title;
  final String image;

  const BookingPlaceInfoModel({
    required this.title,
    required this.image,
  });

  factory BookingPlaceInfoModel.fromJson(Map<String, dynamic> json) {
    return BookingPlaceInfoModel(
      title: json['title'],
      image: json['image'],
    );
  }

  BookingPlaceInfoEntity toEntity() => BookingPlaceInfoEntity(
    title: title,
    image: image,
  );
}