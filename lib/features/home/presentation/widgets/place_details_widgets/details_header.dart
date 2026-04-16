import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/shared/cubits/favorites_cubit/favorites_cubit.dart';
import 'package:guide_me/core/shared/entities/place_entity.dart';
import 'package:guide_me/core/widgets/arrow_back_button.dart';
import 'package:guide_me/features/home/presentation/widgets/place_details_widgets/place_images.dart';

class DetailsHeader extends StatelessWidget {
  const DetailsHeader({super.key, required this.place});
  final PlaceEntity place;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Stack(
      children: [
        PlaceImages(place: place),
        // Arrow Back Button
        Positioned(
          top: context.isPortrait ? size.height * 0.05 : size.width * 0.03,
          left: 32.p,
          child: const ArrowBackButton(),
        ),

        Positioned(
          left: 32.p,
          bottom: 28,
          child: _PlaceFavButton(place: place),
        ),
      ],
    );
  }
}

class _PlaceFavButton extends StatelessWidget {
  const _PlaceFavButton({required this.place});

  final PlaceEntity place;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        final isFav = context.read<FavoritesCubit>().isFavorite(place.id);
        return GestureDetector(
          onTap: () {
            context.read<FavoritesCubit>().toggleFavorite(
              place,
            );
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: Icon(
                key: ValueKey(isFav),
                isFav ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                color: isFav ? Colors.red : null,
              ),
            ),
          ),
        );
      },
    );
  }
}
