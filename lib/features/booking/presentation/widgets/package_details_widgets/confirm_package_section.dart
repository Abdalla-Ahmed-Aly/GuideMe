import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/features/booking/presentation/args/package_args.dart';

class ConfirmPackageSection extends StatelessWidget {
  const ConfirmPackageSection({super.key});

  @override
  Widget build(BuildContext context) {
    final packageArgs = GoRouterState.of(context).extra as PackageArgs;
    final package = packageArgs.package;
    final numberOfPersons = packageArgs.numberOfPersons;
    return Container(
      padding: EdgeInsets.only(
        left: 24.p,
        right: 24.p,
        top: 16,
        bottom: MediaQuery.of(context).viewPadding.bottom + 8,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: const Border(top: BorderSide(color: Color(0xffF3F4F6))),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Column(
        children: [
          // number of places
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n.numberOfPlaces,
                style: AppTextStyles.poppinsMedium14.copyWith(
                  color: const Color(0xff4B5563),
                ),
              ),

              Text(
                context.l10n.placesCount(package.places.length),
                style: AppTextStyles.poppinsBold14,
              ),
            ],
          ),

          const SizedBox(height: 12),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n.persons,
                style: AppTextStyles.poppinsMedium14.copyWith(
                  color: const Color(0xff4B5563),
                ),
              ),

              Text(
                context.l10n.personsCount(numberOfPersons),
                style: AppTextStyles.poppinsBold14,
              ),
            ],
          ),

          const SizedBox(height: 12),

          const Divider(
            color: Color(0xffE5E7EB),
            thickness: 1,
            height: 1,
          ),

          const SizedBox(height: 14),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n.totalEstimatedPrice,
                style: AppTextStyles.poppinsBold16,
              ),

              Text(
                "\$${(package.totalPrice * numberOfPersons)}",
                style: AppTextStyles.poppinsBold20.copyWith(
                  color: AppColors.primary2,
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          AppButton(
            onPressed: () {
              context.push(AppRoutes.bookPackageScreen, extra: packageArgs);
            },
            text: context.l10n.confirmPackage,
            backgroundColor: AppColors.primary2,
            textStyle: AppTextStyles.poppinsBold18,
          ),
        ],
      ),
    );
  }
}
