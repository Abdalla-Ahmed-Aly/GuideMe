import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/shared/entities/place_info_entity.dart';

class TagsSection extends StatelessWidget {
  const TagsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final place = GoRouterState.of(context).extra as PlaceInfoEntity;
    return Row(
      children: [
        if (place.isPopular ?? false) _tags(title: context.l10n.popular),
        if (place.isBest ?? false) _tags(title: context.l10n.best),
        if (place.isCheap ?? false) _tags(title: context.l10n.cheap),
      ],
    );
  }

  Widget _tags({required String title}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: AppColors.primary2.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        title,
        style: AppTextStyles.poppinsBold14.copyWith(
          color: AppColors.primary2,
        ),
      ),
    );
  }
}
