import 'package:flutter/material.dart';
import 'package:guide_me/features/home/presentation/widgets/explore_places_widgets/explore_places_header.dart';
import 'package:guide_me/features/home/presentation/widgets/explore_places_widgets/explore_places_list_view.dart';

class ExplorePlacesScreen extends StatelessWidget {
  const ExplorePlacesScreen({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Column(
        children: [
          // header
          ExplorePlacesHeader(title: title),

          const SizedBox(height: 8),

          // Places List View
          const Expanded(
            child: ExplorePlacesListView(),
          ),
        ],
      ),
    );
  }
}
