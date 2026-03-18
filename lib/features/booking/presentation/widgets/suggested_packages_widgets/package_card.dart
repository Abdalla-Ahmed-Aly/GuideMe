import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/features/booking/domain/entities/booking_package_entity.dart';
import 'package:guide_me/features/booking/presentation/args/filter_args.dart';
import 'package:guide_me/features/booking/presentation/args/package_args.dart';
import 'package:guide_me/features/booking/presentation/widgets/suggested_packages_widgets/package_images_preview.dart';

class PackageCard extends StatelessWidget {
  const PackageCard({super.key, required this.package});

  final BookingPackageEntity package;

  @override
  Widget build(BuildContext context) {
    final images = package.places.map((place) => place.images.first).toList();
    final filterArgs = GoRouterState.of(context).extra as FilterArgs;
    final numberOfPersons = filterArgs.numberOfPersons;
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xffF1F5F9)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            offset: const Offset(0, 1),
            blurRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            height: context.screenHeight * 0.2,
            child: PackageImagesPreview(images: images),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.l10n.priceStartingAt,
                          style: AppTextStyles.interMedium14.copyWith(
                            color: const Color(0xff94A3B8),
                          ),
                        ),

                        Text(
                          "\$${package.totalPrice}",
                          style: AppTextStyles.interBold22.copyWith(
                            color: AppColors.primary2,
                          ),
                        ),
                      ],
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 6,
                        horizontal: 12,
                      ),
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
                            context.l10n.placesCount(package.places.length),
                            style: AppTextStyles.interSemiBold14,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                AppButton(
                  onPressed: () {
                    final packageArgs = PackageArgs(
                      package: package,
                      numberOfPersons: numberOfPersons,
                    );
                    context.push(
                      AppRoutes.packageDetailsScreen,
                      extra: packageArgs,
                    );
                  },
                  text: context.l10n.viewDetails,
                  height: 44,
                  radius: 12,
                  backgroundColor: AppColors.primary2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
