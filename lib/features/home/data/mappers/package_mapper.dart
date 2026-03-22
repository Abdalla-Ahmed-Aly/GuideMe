import 'package:guide_me/core/shared/mapper/city_mapper.dart';
import 'package:guide_me/core/shared/mapper/place_info_mapper.dart';
import 'package:guide_me/features/home/data/model/package_model.dart';
import 'package:guide_me/features/home/domain/entity/package_entity.dart';

class PackageMapper {
  static PackageEntity toEntity(PackageModel model) {
    return PackageEntity(
      packageId: model.packageId,
      title: model.title,
      description: model.description,
      places: model.places.map((e) => PlaceInfoMapper.toEntity(e)).toList(),
      city: CityMapper.toEntity(model.city),
      totalPrice: model.totalPrice,
      budget: model.budget,
      packagePhoto: model.packagePhoto,
      generatedDate: model.generatedDate,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }
}