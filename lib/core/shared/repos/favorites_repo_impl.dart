import 'package:guide_me/core/shared/entities/place_entity.dart';
import 'package:guide_me/core/shared/mapper/place_mapper.dart';
import 'package:guide_me/core/shared/data_sources/favorites_local_data_source.dart';
import 'package:guide_me/core/shared/repos/favorites_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: FavoritesRepo)
class FavoritesRepoImpl implements FavoritesRepo {
  final FavoritesLocalDataSource _localDataSource;

  FavoritesRepoImpl(this._localDataSource);

  @override
  bool isFavorite(String id) {
    return _localDataSource.isFavorite(id);
  }

  @override
  List<PlaceEntity> getFavorites() {
    final models = _localDataSource.getFavorites();
    return models.map((m) => PlaceMapper.toEntity(m)).toList();
  }

  @override
  Future<void> removeFavorite(String id) async {
    await _localDataSource.removeFavorite(id);
  }

  @override
  Future<void> saveFavorite(PlaceEntity place) async {
    final model = PlaceMapper.toModel(place);
    await _localDataSource.saveFavorite(model);
  }
}
