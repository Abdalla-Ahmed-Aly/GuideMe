import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guide_me/core/app_assets/app_icons.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/features/booking/domain/entities/guider_entities/guide_details_entity.dart';
import 'package:guide_me/features/booking/presentation/widgets/guide_profile_widgets/language_item.dart';

class GuideSpokenLanguagesSection extends StatelessWidget {
  const GuideSpokenLanguagesSection({
    super.key,
    required this.guide,
  });

  final GuideDetailsEntity guide;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          AppIcons.earth,
          width: 24,
          height: 24,
          colorFilter: const ColorFilter.mode(
            AppColors.primary2,
            BlendMode.srcIn,
          ),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: guide.languages
                .map((e) => LanguageItem(text: e))
                .toList(),
          ),
        ),
      ],
    );
  }
}
