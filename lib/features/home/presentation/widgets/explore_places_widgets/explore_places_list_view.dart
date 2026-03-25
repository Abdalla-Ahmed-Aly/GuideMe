import 'package:flutter/material.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/features/home/presentation/widgets/explore_places_widgets/place_list_tile.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/features/home/presentation/cubits/get_place_by_category/place_by_category_cubit.dart';
import 'package:guide_me/features/home/presentation/cubits/get_place_by_category/place_by_category_state.dart';

import 'package:guide_me/features/home/presentation/cubits/get_place_by_city/place_by_city_cubit.dart';
import 'package:guide_me/features/home/presentation/cubits/get_place_by_city/place_by_city_state.dart';

import 'package:guide_me/features/home/presentation/widgets/home_widgets/home_shimmers.dart';

class ExplorePlacesListView extends StatelessWidget {
  const ExplorePlacesListView({super.key, this.categoryId, this.cityId});

  final String? categoryId;
  final String? cityId;

  @override
  Widget build(BuildContext context) {
    if (categoryId != null) {
      return BlocBuilder<PlaceByCategoryCubit, PlaceByCategoryState>(
        builder: (context, state) {
          if (state is PlaceByCategoryLoading) {
            return _buildShimmerLoading();
          } else if (state is PlaceByCategoryFailure) {
            return Center(child: Text(state.message));
          } else if (state is PlaceByCategorySuccess) {
            final places = state.placeByCategory.data;
            if (places.isEmpty) {
              return const Center(child: Text('No places found'));
            }
            return _buildListView(context, places);
          }
          return const SizedBox();
        },
      );
    } else if (cityId != null) {
      return BlocBuilder<PlaceByCityCubit, PlaceByCityState>(
        builder: (context, state) {
          if (state is PlaceByCityLoading) {
            return _buildShimmerLoading();
          } else if (state is PlaceByCityFailure) {
            return Center(child: Text(state.message));
          } else if (state is PlaceByCitySuccess) {
            final places = state.placeByCity.data;
            if (places.isEmpty) {
              return const Center(child: Text('No places found'));
            }
            return _buildListView(context, places);
          }
          return const SizedBox();
        },
      );
    } else {
      return const Center(child: Text('No places found'));
    }
  }

  Widget _buildShimmerLoading() {
    return ListView.builder(
      padding: EdgeInsets.only(top: 18, left: 32.p, right: 32.p),
      itemCount: 5,
      itemBuilder: (context, index) => const PlaceListTileShimmer(),
    );
  }

  Widget _buildListView(BuildContext context, List<dynamic> places) {
    return ListView.builder(
      padding: EdgeInsets.only(
        top: 18,
        left: 32.p,
        right: 32.p,
        bottom: MediaQuery.of(context).padding.bottom,
      ),
      itemCount: places.length,
      itemBuilder: (context, index) {
        return PlaceListTile(place: places[index]);
      },
    );
  }
}
