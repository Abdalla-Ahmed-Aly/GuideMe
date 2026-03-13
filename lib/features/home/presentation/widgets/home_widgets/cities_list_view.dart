import 'package:flutter/material.dart';
import 'package:guide_me/core/entites/city_entity.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/features/home/presentation/widgets/home_widgets/city_card.dart';

class CitiesListView extends StatelessWidget {
  final List<CityEntity> popularCities;
  const CitiesListView({super.key, required this.popularCities});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(left: 20.p),
      scrollDirection: Axis.horizontal,
      itemCount: popularCities.length,
      itemBuilder: (context, index) {
        return CityCard(city: popularCities[index]);
      },
    );
  }
}
