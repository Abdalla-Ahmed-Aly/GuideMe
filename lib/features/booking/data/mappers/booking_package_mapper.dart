import 'package:guide_me/core/shared/mapper/place_info_mapper.dart';
import 'package:guide_me/features/booking/data/models/booking_packge_model.dart';
import 'package:guide_me/features/booking/domain/entities/booking_package_entity.dart';

class BookingPackageMapper {
  static BookingPackageEntity toEntity(BookingPackgeModel model) {
    return BookingPackageEntity(
      totalPrice: model.totalPrice.toDouble(),
      places: model.places
          .map((place) => PlaceInfoMapper.toEntity(place))
          .toList(),
    );
  }
}
