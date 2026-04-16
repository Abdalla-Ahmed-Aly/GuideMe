import 'package:guide_me/core/shared/entities/place_entity.dart';

abstract class FavoritesRepo {
  Future<void> saveFavorite(PlaceEntity place);
  Future<void> removeFavorite(String id);
  List<PlaceEntity> getFavorites();
  bool isFavorite(String id);
}
