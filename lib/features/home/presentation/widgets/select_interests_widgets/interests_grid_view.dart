import 'package:flutter/material.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/features/home/presentation/widgets/select_interests_widgets/intersests_card.dart';

class InterestsGridView extends StatelessWidget {
  const InterestsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> interestsImages = [
      AppImages.historical,
      AppImages.adventure,
      AppImages.museums,
      AppImages.islamic,
    ];
    final List<String> interestsTitles = [
      context.l10n.historical,
      context.l10n.adventure,
      context.l10n.museums,
      context.l10n.islamic,
    ];
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 70.p),
      physics: const ClampingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 50,
        mainAxisSpacing: 50,
        childAspectRatio: context.isPortrait ? 2 / 2.5 : 2.5 / 2,
      ),
      itemCount: 4,
      itemBuilder: (context, index) {
        return IntersestsCard(
          image: interestsImages[index],
          title: interestsTitles[index],
        );
      },
    );
  }
}
