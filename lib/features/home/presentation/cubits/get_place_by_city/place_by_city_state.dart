import 'package:guide_me/features/home/domain/entity/place_by_cities_entity.dart';

abstract class PlaceByCityState {}

class PlaceByCityInitial extends PlaceByCityState {}

class PlaceByCityLoading extends PlaceByCityState {}

class PlaceByCitySuccess extends PlaceByCityState {
  final PlaceByCitiesEntity placeByCity;

  PlaceByCitySuccess(this.placeByCity);
}

class PlaceByCityFailure extends PlaceByCityState {
  final String message;

  PlaceByCityFailure(this.message);
}
