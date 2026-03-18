import 'package:flutter/material.dart';
import 'package:guide_me/features/booking/presentation/widgets/package_place_details_widgets/package_place_app_bar.dart';
import 'package:guide_me/features/booking/presentation/widgets/package_place_details_widgets/place_info_section.dart';

class PackagePlaceDetailsScreen extends StatelessWidget {
  const PackagePlaceDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
           PackagePlaceAppBar(),

          SliverToBoxAdapter(
            child: PlaceInfoSection(),
          ),
        ],
      ),
    );
  }
}
