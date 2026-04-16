import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/errors/failure_ui_mapper.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/widgets/failure_message_widget.dart';
import 'package:guide_me/core/shared/cubits/favorites_cubit/favorites_cubit.dart';
import 'package:guide_me/features/profile/presentation/widgets/fav_screen_widgets/empty_fav_state.dart';
import 'package:guide_me/features/profile/presentation/widgets/fav_screen_widgets/fav_places_list_view.dart';

class FavPlacesBlocBuilderStates extends StatelessWidget {
  const FavPlacesBlocBuilderStates({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        if (state is FavoritesLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.primary2,
            ),
          );
        } else if (state is FavoritesEmpty) {
          return const EmptyFavState();
        } else if (state is FavoritesSuccess) {
          return FavPlacesListView(favorites: state.favorites);
        } else if (state is FavoritesFailure) {
          final error = FailureUiMapper.map(
            context: context,
            failure: state.failure,
          );
          return FailureMessageWidget(error: error.message);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
