import 'package:guide_me/features/booking/domain/entities/place_info_entity.dart';

class BookingPackageEntity {
  final double totalPrice;
  final List<PlaceInfoEntity> places;

  BookingPackageEntity({
    required this.totalPrice,
    required this.places,
  });
}