import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/shared/entities/guider_entity.dart';
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
            child: guider.photo != null && guider.photo!.url != null
                ? CustomNetworkImage(imageUrl: guider.photo!.url!)
                : const Icon(
                    Icons.person_outline,
                    size: 30,
                    color: AppColors.primary2,
                  ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Text(
              guider.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.poppinsMedium18,
            ),
          ),

          const SizedBox(width: 8),

          const Icon(
            Icons.arrow_forward_ios_rounded,
            color: AppColors.primary2,
            size: 20,
          ),
        ],
      ),
    );
  }
}
