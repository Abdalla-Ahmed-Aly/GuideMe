import 'package:flutter/material.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/shared/entities/place_info_entity.dart';
import 'package:guide_me/core/widgets/package_place_item.dart';

class AiPackagePlacesListView extends StatelessWidget {
  const AiPackagePlacesListView({super.key, required this.places});
  final List<PlaceInfoEntity> places;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: places.length,
      padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 16),
      itemBuilder: (context, index) {
        return PackagePlaceItem(place: places[index]);
      },
    );
  }
}