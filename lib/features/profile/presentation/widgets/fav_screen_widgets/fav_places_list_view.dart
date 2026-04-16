import 'package:flutter/material.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/shared/entities/place_entity.dart';
import 'package:guide_me/features/home/presentation/widgets/explore_places_widgets/place_list_tile.dart';

class FavPlacesListView extends StatelessWidget {
  const FavPlacesListView({
    super.key,
    required this.favorites,
  });
  final List<PlaceEntity> favorites;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.p, vertical: 16),
      itemCount: favorites.length,
      itemBuilder: (context, index) {
        return PlaceListTile(place: favorites[index]);
      },
    );
  }
}