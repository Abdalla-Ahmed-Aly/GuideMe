import 'package:flutter/material.dart';
import 'package:guide_me/core/entites/place_entity.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/features/home/presentation/widgets/home_widgets/most_famous_trip_card.dart';

class MostFamousTripListView extends StatelessWidget {
  final PlaceEntity mostFamousTrip;
  const MostFamousTripListView({super.key, required this.mostFamousTrip});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(left: 20.p),
      scrollDirection: Axis.horizontal,
      children: [
        MostFamousTripCard(mostFamousTrip: mostFamousTrip),
      ],
    );
  }
}
