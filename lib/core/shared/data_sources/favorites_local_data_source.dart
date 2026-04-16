import 'dart:convert';

import 'package:guide_me/core/constants/hive_constants.dart';
import 'package:guide_me/core/shared/models/place_model.dart';
import 'package:guide_me/core/utils/hive_helper.dart';
import 'package:injectable/injectable.dart';

abstract class FavoritesLocalDataSource {
  Future<void> saveFavorite(PlaceModel place);
  Future<void> removeFavorite(String id);
  List<PlaceModel> getFavorites();
  bool isFavorite(String id);
}

@LazySingleton(as: FavoritesLocalDataSource)
class FavoritesLocalDataSourceImpl implements FavoritesLocalDataSource {
  @override
  bool isFavorite(String id) {
    return HiveHelper.get<Map>(
          boxName: HiveConstants.favoritesBox,
          key: id,
        ) !=
        null;
  }

  @override
  List<PlaceModel> getFavorites() {
    final maps = HiveHelper.getAll<Map>(name: HiveConstants.favoritesBox);
    return maps.map((map) {
      final jsonString = jsonEncode(map);
      return PlaceModel.fromJson(
        jsonDecode(jsonString) as Map<String, dynamic>,
      );
    }).toList();
  }

  @override
  Future<void> removeFavorite(String id) async {
    await HiveHelper.delete<Map>(
      boxName: HiveConstants.favoritesBox,
      key: id,
    );
  }

  @override
  Future<void> saveFavorite(PlaceModel place) async {
    if (place.id == null) return;
    await HiveHelper.put<Map>(
      boxName: HiveConstants.favoritesBox,
      key: place.id,
      data: place.toJson(),
    );
  }
}
