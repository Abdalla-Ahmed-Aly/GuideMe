import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/package_images_preview.dart';
import 'package:guide_me/features/home/domain/entity/package_entity.dart';

class PackageImageSection extends StatelessWidget {
  const PackageImageSection({
    super.key,
    required this.package,
  });

  final PackageEntity package;

  @override
  Widget build(BuildContext context) {
    final images = package.places.map((p) => p.images.first).toList();
    return Container(
      height: 150.h,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.natural2,
          strokeAlign: BorderSide.strokeAlignOutside,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary2.withValues(alpha: .7),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          PackageImagesPreview(images: images),
          Positioned(
            bottom: 16,
            right: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xffF1F5F9).withValues(alpha: .8),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.map_outlined,
                    color: AppColors.primary2,
                    size: 22,
                  ),

                  const SizedBox(width: 4),

                  Text(
                    context.l10n.placesCount(package.places.length),
                    style: AppTextStyles.interBold14,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
