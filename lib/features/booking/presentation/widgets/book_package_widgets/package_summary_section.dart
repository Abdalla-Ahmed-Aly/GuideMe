import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/booking/presentation/args/package_args.dart';

class PackageSummarySection extends StatelessWidget {
  const PackageSummarySection({super.key});

  @override
  Widget build(BuildContext context) {
    final package = GoRouterState.of(context).extra as PackageArgs;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.primary2.withValues(alpha: .05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.primary2.withValues(alpha: .1)),
      ),
      child: Column(
        children: [
          // number of persons
          Row(
            children: [
              const Icon(
                Icons.people_alt_outlined,
                color: AppColors.primary2,
              ),

              const SizedBox(width: 12),

              Text(
                context.l10n.numberofperson,
                style: AppTextStyles.poppinsMedium16.copyWith(
                  color: const Color(0xff334155),
                ),
              ),

              const Spacer(),

              Text(
                context.l10n.personsCount(package.numberOfPersons),
                style: AppTextStyles.poppinsBold18,
              ),
            ],
          ),

          const SizedBox(height: 16),

          Divider(
            color: AppColors.primary2.withValues(alpha: .1),
            thickness: 1,
            height: 1,
          ),

          const SizedBox(height: 16),

          // total price
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n.totalPrice,
                style: AppTextStyles.poppinsBold18,
              ),

              Text(
                "\$${(package.package.totalPrice * package.numberOfPersons)}",
                style: AppTextStyles.poppinsBold24.copyWith(
                  color: AppColors.primary2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
