import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/entities/guider_entity.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/custom_network_image.dart';

class GuiderProfileSection extends StatelessWidget {
  const GuiderProfileSection({
    super.key,
    required this.guider,
  });
  final GuiderEntity guider;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRoutes.guideProfileScreen, extra: guider);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 48,
            height: 48,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xffFFA537),
                strokeAlign: BorderSide.strokeAlignOutside,
              ),
            ),
            child: CustomNetworkImage(imageUrl: guider.photo.url),
          ),

          const SizedBox(width: 12),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                guider.name,
                style: AppTextStyles.poppinsMedium18,
              ),

              const SizedBox(height: 2),

              Row(
                children: [
                  const Icon(
                    Icons.star_rate_rounded,
                    color: AppColors.yellow,
                    size: 20,
                  ),

                  const SizedBox(width: 2),

                  Text(
                    "4.9",
                    style: AppTextStyles.poppinsBold14.copyWith(
                      color: AppColors.yellow,
                    ),
                  ),

                  const SizedBox(width: 6),

                  Text(
                    '(12 tour)',
                    style: AppTextStyles.poppinsRegular14.copyWith(
                      color: const Color(0xff8794A4),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
