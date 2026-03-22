import 'package:guide_me/core/entites/category_entity.dart';
import 'package:guide_me/core/entites/city_entity.dart';
import 'package:guide_me/core/entites/place_entity.dart';
import 'package:guide_me/core/models/category_model.dart';
import 'package:guide_me/core/models/city_model.dart';
import 'package:guide_me/core/models/places_model.dart';
import 'package:guide_me/features/home/data/model/home_model.dart';
import 'package:guide_me/features/home/data/model/place_by_category_model.dart';
import 'package:guide_me/features/home/data/model/place_by_cities_model.dart';
import 'package:guide_me/features/home/data/model/package_model.dart';
import 'package:guide_me/features/home/domain/entity/home_entity.dart';
import 'package:guide_me/features/home/domain/entity/package_entity.dart';
import 'package:guide_me/features/home/domain/entity/place_by_category_entity.dart';
import 'package:guide_me/features/home/domain/entity/place_by_cities_entity.dart';

class Mapper {
  static HomeEntity mapHomeModelToHomeEntity(HomeModel model) {
    return HomeEntity(
      categories: model.categories
          .map(
            (category) => mapCategoryModelToEntity(category as CatogryModel),
          )
          .toList(),
      mostFamousTrip: mapPlaceModelToEntity(
        model.mostFamousTrip as PlacesModel,
      ),
      travelBeyondBoundary: model.travelBeyondBoundary
          .map((place) => mapPlaceModelToEntity(place as PlacesModel))
          .toList(),
      popularCities: model.popularCities
          .map((city) => mapCityModelToEntity(city as CityModel))
          .toList(),
    );
  }

  static CategoryEntity mapCategoryModelToEntity(CatogryModel model) {
    return CategoryEntity(
      id: model.id,
      name: model.name,
      image: model.image,
      slug: model.slug,
    );
  }

  static CityEntity mapCityModelToEntity(CityModel model) {
    return CityEntity(
      id: model.id,
      name: model.name,
      image: model.image,
      isPopular: model.isPopular,
    );
  }

  static PlaceEntity mapPlaceModelToEntity(PlacesModel model) {
    return PlaceEntity(
      id: model.id,
      title: model.title,
      description: model.description,
      category: model.category,
      price: model.price,
      images: model.images,
      location: model.location,
      rating: model.rating,
      reviewsCount: model.reviewsCount,
      reviewsSummary: model.reviewsSummary,
      city: model.city,
      minPersons: model.minPersons,
      maxPersons: model.maxPersons,
      isPopular: model.isPopular,
      isBest: model.isBest,
      isCheap: model.isCheap,
      durationMinutes: model.durationMinutes,
    );
  }

  static PlaceByCategoryEntity mapPlaceByCategoryModelToEntity(
    PlaceByCategoryModel model,
  ) {
    return PlaceByCategoryEntity(
      filterApplied: model.filterApplied,
      count: model.count,
      data: model.data
          .map((place) => mapPlaceModelToEntity(place as PlacesModel))
          .toList(),
    );
  }

  static PlaceByCitiesEntity mapPlaceByCitiesModelToEntity(
    PlaceByCitiesModel model,
  ) {
    return PlaceByCitiesEntity(
      filterApplied: model.filterApplied,
      count: model.count,
      data: model.data
          .map((place) => mapPlaceModelToEntity(place as PlacesModel))
          .toList(),
    );
  }

  static PackageEntity mapPackageModelToEntity(PackageModel model) {
    return PackageEntity(
      packageId: model.packageId,
      title: model.title,
      description: model.description,
      places: model.places
          .map((place) => mapPlaceModelToEntity(place as PlacesModel))
          .toList(),
      city: mapCityModelToEntity(model.city as CityModel),
      totalPrice: model.totalPrice,
      budget: model.budget,
      packagePhoto: model.packagePhoto,
      generatedDate: model.generatedDate,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }
}
