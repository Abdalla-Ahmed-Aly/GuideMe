import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/features/booking/presentation/args/package_args.dart';
import 'package:guide_me/core/widgets/package_place_item.dart';

class PackagePlacesListView extends StatelessWidget {
  const PackagePlacesListView({super.key});

  @override
  Widget build(BuildContext context) {
    final packageArgs = GoRouterState.of(context).extra as PackageArgs;
    final package = packageArgs.package;
    return ListView.builder(
      itemCount: package.places.length,
      padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 16),
      itemBuilder: (context, index) {
        return PackagePlaceItem(place: package.places[index]);
      },
    );
  }
}
