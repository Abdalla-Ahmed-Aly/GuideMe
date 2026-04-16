part of 'favorites_cubit.dart';

abstract class FavoritesState {}

class FavoritesInitial extends FavoritesState {}

class FavoritesLoading extends FavoritesState {}

class FavoritesSuccess extends FavoritesState {
  final List<PlaceEntity> favorites;
  FavoritesSuccess(this.favorites);
}

class FavoritesEmpty extends FavoritesState {}

class FavoritesFailure extends FavoritesState {
  final Failure failure;
  FavoritesFailure(this.failure);
}
