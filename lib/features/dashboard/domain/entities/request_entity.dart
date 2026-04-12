import 'package:guide_me/core/shared/entities/location_entity.dart';

class RequestCardEntity {
  final String userName;
  final String userImage;
  final String language;
  final int price;
  final String priceType;
  final String placeTitle;
  final DateTime date;
  final num durationMinutes;
  final int groupSize;
  final String bookingid;
  final LocationEntity? locationEntity;
  const RequestCardEntity({
    required this.userName,
    required this.userImage,
    required this.language,
    required this.price,
    required this.priceType,
    required this.placeTitle,
    required this.date,
    required this.durationMinutes,
    required this.groupSize,
    required this.bookingid, required this.locationEntity,
  });
}
