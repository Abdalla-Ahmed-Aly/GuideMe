import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/booking/presentation/args/package_args.dart';
import 'package:guide_me/features/booking/presentation/widgets/suggested_packages_widgets/package_images_preview.dart';

class PackageImagesSection extends StatelessWidget {
  const PackageImagesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final package = GoRouterState.of(context).extra as PackageArgs;
    final packageImages = package.package.places
        .map((place) => place.images.first)
        .toList();
    return Container(
      clipBehavior: Clip.hardEdge,
      height: context.screenHeight * 0.21,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xffE2E8F0),
          strokeAlign: BorderSide.strokeAlignOutside,
        ),
      ),
      child: Stack(
        children: [
          PackageImagesPreview(
            images: packageImages,
          ),

          Positioned(
            bottom: 16,
            right: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xffF1F5F9),
                borderRadius: BorderRadius.circular(8),
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
                    context.l10n.placesCount(package.package.places.length),
                    style: AppTextStyles.interSemiBold14,
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
