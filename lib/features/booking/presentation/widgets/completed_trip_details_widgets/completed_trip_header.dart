import 'package:flutter/material.dart';
import 'package:guide_me/core/entities/guider_entity.dart';
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
            TextSpan(
              text: context.l10n.theTourwaswith,
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
          child: CustomNetworkImage(
            imageUrl: guider.photo.url,
            height: 90,
            width: 90,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
