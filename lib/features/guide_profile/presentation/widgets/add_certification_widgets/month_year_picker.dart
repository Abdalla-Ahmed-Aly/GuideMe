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
        initialDate: selectedDate,
        showDay: false,
        columnWidth: 100,
        endDate: DateTime(2100),
        labelStyle: AppTextStyles.interBold18,
        selectedRowStyle: AppTextStyles.interSemiBold16.copyWith(
          color: Colors.white,
        ),
        unselectedRowStyle: AppTextStyles.interRegular16,
        monthDecoration: const BoxDecoration(
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(16),
          ),
          color: AppColors.primary2,
        ),
        yearDecoration: const BoxDecoration(
          borderRadius: BorderRadius.horizontal(
            right: Radius.circular(16),
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
            "Set",
            style: AppTextStyles.interBold16.copyWith(
              color: AppColors.black,
            ),
          ),
        ),
      ],
    );
  }
}
