import 'package:guide_me/features/home/domain/entity/place_by_category_entity.dart';

abstract class PlaceByCategoryState {}

class PlaceByCategoryInitial extends PlaceByCategoryState {}

class PlaceByCategoryLoading extends PlaceByCategoryState {}

class PlaceByCategorySuccess extends PlaceByCategoryState {
  final PlaceByCategoryEntity placeByCategory;

  PlaceByCategorySuccess(this.placeByCategory);
}

class PlaceByCategoryFailure extends PlaceByCategoryState {
  final String message;

  PlaceByCategoryFailure(this.message);
}
