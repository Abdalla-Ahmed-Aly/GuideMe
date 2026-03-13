import 'package:flutter/material.dart';
import 'package:guide_me/core/entites/place_entity.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/features/home/presentation/widgets/home_widgets/place_card.dart';

class PlacesListView extends StatelessWidget {
  final List<PlaceEntity> travelBeyondBoundary;
  const PlacesListView({super.key, required this.travelBeyondBoundary});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(left: 20.p),
      scrollDirection: Axis.horizontal,
      itemCount: travelBeyondBoundary.length,
      itemBuilder: (context, index) {
        return PlaceCard(place: travelBeyondBoundary[index]);
      },
    );
  }
}
