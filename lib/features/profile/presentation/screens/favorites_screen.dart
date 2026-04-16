import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/profile/presentation/widgets/fav_screen_widgets/fav_places_bloc_builder_states.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            context.pop();
          },
        ),
        title: Text(
          context.l10n.favorites,
          style: AppTextStyles.poppinsBold22,
        ),
        bottom: const PreferredSize(
          preferredSize: Size(double.infinity, 1),
          child: Divider(
            color: AppColors.natural2,
            height: 1,
            thickness: 1,
          ),
        ),
      ),
      body: const FavPlacesBlocBuilderStates(),
    );
  }
}
