import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/features/home/domain/entity/package_entity.dart';

class BookingAiPackageSection extends StatelessWidget {
  const BookingAiPackageSection({super.key, required this.package});
  final PackageEntity package;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        left: 20.p,
        right: 20.p,
        top: 16,
        bottom: MediaQuery.of(context).viewPadding.bottom + 8,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: const Border(
          top: BorderSide(color: Color(0xffF3F4F6)),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.l10n.totalPrice,
                style: AppTextStyles.poppinsRegular16,
              ),

              const SizedBox(height: 2),
              Text.rich(
                TextSpan(
                  text: package.totalPrice.toDouble().toString(),
                  style: AppTextStyles.poppinsBold24,
                  children: [
                    TextSpan(
                      text: " ${context.l10n.egp}",
                      style: AppTextStyles.poppinsRegular16,
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(width: 12),

          Expanded(
            child: AppButton(
              onPressed: () {
                context.push(AppRoutes.bookAiPackageScreen, extra: package);
              },
              text: context.l10n.bookNow,
              backgroundColor: AppColors.primary2,
              radius: 16,
            ),
          ),
        ],
      ),
    );
  }
}
