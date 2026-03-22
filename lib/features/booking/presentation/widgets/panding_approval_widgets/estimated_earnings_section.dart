import 'package:flutter/material.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class EstimatedEarningsSection extends StatelessWidget {
  const EstimatedEarningsSection({
    super.key,
    this.color,
    required this.price,
  });
  final Color? color;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
      decoration: BoxDecoration(
        color: color ?? const Color(0xffFFE5BA).withValues(alpha: .20),
        border: Border.all(color: const Color(0xffFFE5BA)),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.l10n.estimatedEarnings,
                style: AppTextStyles.poppinsRegular14.copyWith(
                  color: const Color(0xff7C6965),
                ),
              ),

              const SizedBox(height: 6),

              Text(
                '$price EGP',
                style: AppTextStyles.poppinsSemiBold20,
              ),
            ],
          ),

          Image.asset(AppImages.money),
        ],
      ),
    );
  }
}
