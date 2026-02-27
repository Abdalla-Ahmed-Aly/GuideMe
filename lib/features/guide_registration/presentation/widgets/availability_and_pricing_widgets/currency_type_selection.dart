import 'package:flutter/material.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/guide_registration/domain/enums/currency_type.dart';

class CurrencyTypeSelection extends StatefulWidget {
  const CurrencyTypeSelection({super.key});

  @override
  State<CurrencyTypeSelection> createState() => _CurrencyTypeSelectionState();
}

class _CurrencyTypeSelectionState extends State<CurrencyTypeSelection> {
  CurrencyType _selectedCurrencyType = CurrencyType.USD;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xffE6E6E6),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          _buildCurrencyButton(CurrencyType.USD),
          _buildCurrencyButton(CurrencyType.EGP),
        ],
      ),
    );
  }

  Widget _buildCurrencyButton(CurrencyType currencyType) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCurrencyType = currencyType;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          color: _selectedCurrencyType == currencyType
              ? const Color(0xffF8F7F5)
              : const Color(0xffE6E6E6),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          currencyType.name,
          style: AppTextStyles.poppinsMedium16.copyWith(
            color: _selectedCurrencyType == currencyType
                ? Colors.black
                : const Color(0xff9A9795),
          ),
        ),
      ),
    );
  }
}
