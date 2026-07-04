import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:linear_date_picker/linear_date_picker.dart';

class MonthYearPicker extends StatefulWidget {
  const MonthYearPicker({
    super.key,
  });

  @override
  State<MonthYearPicker> createState() => _MonthYearPickerState();
}

class _MonthYearPickerState extends State<MonthYearPicker> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      contentPadding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 24,
      ),
      actionsPadding: const EdgeInsets.all(16),
      content: LinearDatePicker(
        yearLabel: context.l10n.year,
        monthLabel: context.l10n.month,
        initialDate: selectedDate,
        showDay: false,
        columnWidth: 100,
        endDate: DateTime(2100),
        labelStyle: AppTextStyles.interBold18,
        selectedRowStyle: AppTextStyles.interSemiBold16.copyWith(
          color: Colors.white,
        ),
        unselectedRowStyle: AppTextStyles.interRegular16,
        monthDecoration: BoxDecoration(
          borderRadius: BorderRadius.horizontal(
            left: context.isEnglish
                ? const Radius.circular(16)
                : const Radius.circular(0),
            right: context.isEnglish
                ? const Radius.circular(0)
                : const Radius.circular(16),
          ),
          color: AppColors.primary2,
        ),
        yearDecoration: BoxDecoration(
          borderRadius: BorderRadius.horizontal(
            left: context.isArabic
                ? const Radius.circular(16)
                : const Radius.circular(0),
            right: context.isArabic
                ? const Radius.circular(0)
                : const Radius.circular(16),
          ),
          color: AppColors.primary2,
        ),

        showMonthName: true,
        dateChangeListener: (DateTime date) {
          setState(() {
            selectedDate = date;
          });
        },
      ),

      actions: [
        TextButton(
          onPressed: () {
            context.pop();
          },
          child: Text(
            context.l10n.cancel,
            style: AppTextStyles.interRegular16.copyWith(
              color: AppColors.black,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            context.pop(selectedDate);
          },
          child: Text(
            context.l10n.set,
            style: AppTextStyles.interBold16.copyWith(
              color: AppColors.black,
            ),
          ),
        ),
      ],
    );
  }
}
