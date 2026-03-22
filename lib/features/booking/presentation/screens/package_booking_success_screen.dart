import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/booking/presentation/args/book_package_args.dart';
import 'package:guide_me/core/widgets/package_images_preview.dart';
import 'package:guide_me/features/booking/presentation/widgets/package_booking_success_widgets/buttons_footer_section.dart';
import 'package:guide_me/features/booking/presentation/widgets/package_booking_success_widgets/pacakge_total_price_section.dart';
import 'package:guide_me/features/booking/presentation/widgets/package_booking_success_widgets/package_data_section.dart';

class PackageBookingSuccessScreen extends StatelessWidget {
  const PackageBookingSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final package = GoRouterState.of(context).extra as BookPackageArgs;

    final images = package.packageArgs.package.places
        .map((e) => e.images.first)
        .toList();

    return Scaffold(
      backgroundColor: const Color(0xffF8F6F6),
      body: Column(
        children: [
          // content
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 24,
                left: 24.p,
                right: 24.p,
                bottom: 16.h,
              ),
              child: Column(
                children: [
                  BuildPackageImage(images: images),

                  const SizedBox(height: 16),

                  Text(
                    context.l10n.bookingSuccessfully,
                    style: AppTextStyles.poppinsBold28.copyWith(
                      color: AppColors.primary800,
                    ),
                  ),

                  const SizedBox(height: 20),

                  const PackageDataSection(),

                  const SizedBox(height: 24),

                  PackageTotalPriceSection(
                    totalPrice: package.bookPackageResponseModel.totalPrice,
                  ),
                ],
              ),
            ),
          ),

          // buttons
          const ButtonsFooterSection(),
        ],
      ),
    );
  }
}

class BuildPackageImage extends StatelessWidget {
  const BuildPackageImage({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170.h,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xffE2E8F0),
          strokeAlign: BorderSide.strokeAlignOutside,
        ),
      ),
      child: PackageImagesPreview(images: images),
    );
  }
}
