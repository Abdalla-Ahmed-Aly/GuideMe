import 'package:flutter/material.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/guide_registration/domain/enums/currency_type.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/features/guide_registration/presentation/cubits/guide_registration_shared_cubit/guide_registration_shared_cubit.dart';
import 'package:guide_me/features/guide_registration/presentation/cubits/guide_registration_shared_cubit/guide_registration_shared_state.dart';

class CurrencyTypeSelection extends StatelessWidget {
  const CurrencyTypeSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GuideRegistrationSharedCubit, GuideRegistrationSharedState>(
      builder: (context, state) {
        String selectedCurrency = 'USD';
        if (state is GuideRegistrationFormData) {
          selectedCurrency = state.model.currency;
        }

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          decoration: BoxDecoration(
            color: const Color(0xffE6E6E6),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              _buildCurrencyButton(context, CurrencyType.USD, selectedCurrency),
              _buildCurrencyButton(context, CurrencyType.EGP, selectedCurrency),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCurrencyButton(BuildContext context, CurrencyType currencyType, String selectedCurrency) {
    final bool isSelected = selectedCurrency == currencyType.name;
    return GestureDetector(
      onTap: () {
        context.read<GuideRegistrationSharedCubit>().setProfessionalInfo(currency: currencyType.name);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xffF8F7F5)
              : const Color(0xffE6E6E6),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          currencyType.name,
          style: AppTextStyles.poppinsMedium16.copyWith(
            color: isSelected
                ? Colors.black
                : const Color(0xff9A9795),
          ),
        ),
      ),
    );
  }
}
