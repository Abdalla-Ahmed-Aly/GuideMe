import 'package:flutter/material.dart';
import 'package:guide_me/core/shared/entities/guider_entity.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/custom_network_image.dart';

class CompletedTripHeader extends StatelessWidget {
  const CompletedTripHeader({
    super.key,
    required this.guider,
  });

  final GuiderEntity guider;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text.rich(
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            TextSpan(
              text: "${context.l10n.theTourwaswith}\n",
              style: AppTextStyles.poppinsSemiBold28.copyWith(
                color: AppColors.primary2,
              ),
              children: [
                TextSpan(
                  text: guider.name,
                  style: AppTextStyles.poppinsBold32.copyWith(
                    color: AppColors.primary2,
                  ),
                ),
              ],
            ),
          ),
        ),

        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color(0xffFFA537),
              width: 2,
              strokeAlign: BorderSide.strokeAlignOutside,
            ),
          ),
          child: guider.photo != null && guider.photo!.url != null
              ? CustomNetworkImage(
                  imageUrl: guider.photo!.url!,
                  height: 90,
                  width: 90,
                  fit: BoxFit.cover,
                )
              : const Icon(
                  Icons.person_outline,
                  size: 30,
                ),
        ),
      ],
    );
  }
}
