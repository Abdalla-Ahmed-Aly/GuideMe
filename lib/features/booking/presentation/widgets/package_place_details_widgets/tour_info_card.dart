import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/app_assets/app_icons.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/shared/entities/place_info_entity.dart';

class TourInfoCard extends StatelessWidget {
  const TourInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    final place = GoRouterState.of(context).extra as PlaceInfoEntity;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xffE2E8F0)),
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              child: _buildTourInfo(
                svgIcon: AppIcons.clock,
                title: context.l10n.durationText,
                value: "${place.durationMinutes} min",
              ),
            ),

            const VerticalDivider(
              width: 1,
              color: Color(0xffE2E8F0),
            ),

            Expanded(
              child: _buildTourInfo(
                svgIcon: AppIcons.dollar,
                title: context.l10n.priceText,
                value: "\$${place.price}",
              ),
            ),

            const VerticalDivider(
              width: 1,
              color: Color(0xffE2E8F0),
            ),

            Expanded(
              child: _buildTourInfo(
                svgIcon: AppIcons.persons,
                title: context.l10n.persons,
                value: "${place.minPersons}-${place.maxPersons}",
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTourInfo({
    IconData? icon,
    String? svgIcon,
    required String title,
    required String value,
  }) {
    return Column(
      children: [
        if (icon != null)
          Icon(
            icon,
            color: AppColors.primary2,
            size: 22,
          ),
        if (svgIcon != null)
          SvgPicture.asset(
            svgIcon,
            height: 22,
            colorFilter: const ColorFilter.mode(
              AppColors.primary2,
              BlendMode.srcIn,
            ),
          ),

        const SizedBox(height: 4),

        Text(
          title,
          style: AppTextStyles.poppinsMedium14.copyWith(
            color: const Color(0xff64748B),
          ),
        ),

        const SizedBox(height: 4),

        Text(
          value,
          style: AppTextStyles.poppinsBold16,
        ),
      ],
    );
  }
}
