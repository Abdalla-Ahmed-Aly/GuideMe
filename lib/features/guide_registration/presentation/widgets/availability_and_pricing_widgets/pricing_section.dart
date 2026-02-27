import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guide_me/core/app_assets/app_icons.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

import 'currency_type_selection.dart';

class PricingSection extends StatelessWidget {
  const PricingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.l10n.hourlyRate,
              style: AppTextStyles.poppinsMedium16,
            ),

            const CurrencyTypeSelection(),
          ],
        ),

        const SizedBox(height: 16),

        _buildHourlyRateTextField(context),
      ],
    );
  }

  TextField _buildHourlyRateTextField(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      style: AppTextStyles.poppinsSemiBold16,
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
      decoration: InputDecoration(
        hintText: "25.00",
        hintStyle: AppTextStyles.poppinsSemiBold16.copyWith(
          color: const Color(0xff969696),
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 12, right: 6),
          child: SvgPicture.asset(
            AppIcons.coin,
            width: 24,
            height: 24,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}
