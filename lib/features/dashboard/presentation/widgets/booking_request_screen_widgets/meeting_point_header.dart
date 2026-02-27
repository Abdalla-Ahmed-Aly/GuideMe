
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guide_me/core/app_assets/app_icons.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';


class MeetingPointHeader extends StatelessWidget {
  const MeetingPointHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 13),
          decoration: BoxDecoration(
            color: const Color(0xffFEF4E6),
            borderRadius: BorderRadius.circular(20),
          ),
          child: SvgPicture.asset(
            AppIcons.people,
            width: 24.w,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.l10n.mettingpoint,
                style: AppTextStyles.poppinsRegular18.copyWith(
                  color: const Color(0xffA2A9B5),
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                'Giza Plateau Main Entrance',
                style: AppTextStyles.poppinsMedium16,
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xffFEF4E6),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            context.l10n.directions,
            style: AppTextStyles.poppinsMedium14.copyWith(
              color: const Color(0xffF2930D),
            ),
          ),
        ),
      ],
    );
  }
}
