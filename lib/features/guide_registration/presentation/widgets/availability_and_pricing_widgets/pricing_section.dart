import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guide_me/core/app_assets/app_icons.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

import 'currency_type_selection.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/features/guide_registration/presentation/cubits/guide_registration_shared_cubit/guide_registration_shared_cubit.dart';
import 'package:guide_me/features/guide_registration/presentation/cubits/guide_registration_shared_cubit/guide_registration_shared_state.dart';

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

        BlocBuilder<GuideRegistrationSharedCubit, GuideRegistrationSharedState>(
          builder: (context, state) {
            String initialRate = "";
            if (state is GuideRegistrationFormData && state.model.hourlyRate > 0) {
              initialRate = state.model.hourlyRate.toString();
            }
            
            return TextFormField(
              initialValue: initialRate,
              keyboardType: TextInputType.number,
              style: AppTextStyles.poppinsSemiBold16,
              onTapOutside: (_) => FocusScope.of(context).unfocus(),
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return "Hourly rate is required";
                }
                final rate = double.tryParse(val);
                if (rate == null || rate <= 0) {
                  return "Please enter a valid hourly rate";
                }
                return null;
              },
              onChanged: (val) {
                final rate = double.tryParse(val) ?? 0.0;
                context.read<GuideRegistrationSharedCubit>().setProfessionalInfo(hourlyRate: rate);
              },
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
          },
        ),
      ],
    );
  }
}
