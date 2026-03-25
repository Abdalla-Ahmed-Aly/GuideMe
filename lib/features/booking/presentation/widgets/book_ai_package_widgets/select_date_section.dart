import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/booking/presentation/cubits/book_ai_package_cubit/book_ai_package_cubit.dart';
import 'package:intl/intl.dart';

class SelectDateSection extends StatelessWidget {
  const SelectDateSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2100),
        ).then((selectedDate) {
          if (selectedDate != null) {
            context.read<BookAiPackageCubit>().setDate(selectedDate);
          }
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(
              context.l10n.tripDate,
              style: AppTextStyles.poppinsMedium14,
            ),
          ),
          const SizedBox(height: 8),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.primary2.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.calendar_today_outlined,
                  color: AppColors.primary550,
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: BlocBuilder<BookAiPackageCubit, BookAiPackageState>(
                    builder: (context, state) {
                      return Text(
                        state.data.date != null
                            ? DateFormat("yyyy-MM-dd").format(state.data.date!)
                            : context.l10n.selectDate,
                        style: AppTextStyles.poppinsBold16.copyWith(
                          color: AppColors.primary550,
                        ),
                      );
                    },
                  ),
                ),

                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColors.primary550,
                  size: 18,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
