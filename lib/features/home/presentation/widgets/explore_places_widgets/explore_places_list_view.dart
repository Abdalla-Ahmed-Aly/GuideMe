import 'package:flutter/material.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/features/home/presentation/widgets/explore_places_widgets/place_list_tile.dart';

class ExplorePlacesListView extends StatelessWidget {
  const ExplorePlacesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(top: 18, left: 32.p, right: 32.p),
      itemCount: 10,
      itemBuilder: (context, index) {
        return const PlaceListTile();
      },
    );
  }
}
