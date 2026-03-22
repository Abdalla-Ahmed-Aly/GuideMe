import 'package:guide_me/core/shared/entities/place_info_entity.dart';

class BookingPackageEntity {
  final double totalPrice;
  final List<PlaceInfoEntity> places;

  BookingPackageEntity({
    required this.totalPrice,
    required this.places,
  });
}