import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/errors/error_handler.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/core/shared/entities/place_entity.dart';
import 'package:guide_me/core/shared/repos/favorites_repo.dart';
import 'package:injectable/injectable.dart';

part 'favorites_state.dart';

@injectable
class FavoritesCubit extends Cubit<FavoritesState> {
  final FavoritesRepo _favoritesRepo;

  FavoritesCubit(this._favoritesRepo) : super(FavoritesInitial());

  void getFavorites() {
    emit(FavoritesLoading());
    try {
      final favorites = _favoritesRepo.getFavorites();
      if (favorites.isEmpty) {
        emit(FavoritesEmpty());
      } else {
        emit(FavoritesSuccess(favorites));
      }
    } catch (e) {
      emit(FavoritesFailure(ErrorHandler.handle(e)));
    }
  }

  Future<void> toggleFavorite(PlaceEntity place) async {
    if (_favoritesRepo.isFavorite(place.id)) {
      await _favoritesRepo.removeFavorite(place.id);
    } else {
      await _favoritesRepo.saveFavorite(place);
    }
    getFavorites();
  }

  bool isFavorite(String id) => _favoritesRepo.isFavorite(id);
}
