import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/booking/presentation/cubits/book_package_cubit/book_package_cubit.dart';
import 'package:intl/intl.dart';

class SelectDateAndTimeSection extends StatelessWidget {
  const SelectDateAndTimeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BookPackageCubit>();
    return BlocBuilder<BookPackageCubit, BookPackageState>(
      buildWhen: (previous, current) =>
          previous.data.date != current.data.date ||
          previous.data.time != current.data.time,
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: PickCard(
                title: context.l10n.dateCapital,
                icon: Icons.calendar_month_outlined,
                subTitle: cubit.state.data.date != null
                    ? context.l10n.selected
                    : context.l10n.schedule,
                value: cubit.state.data.date != null
                    ? DateFormat("MMM dd, yyyy").format(cubit.state.data.date!)
                    : context.l10n.selectDate,
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: state.data.date ?? DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                  if (date != null) {
                    cubit.pickDate(date);
                  }
                },
              ),
            ),

            const SizedBox(width: 16),

            Expanded(
              child: PickCard(
                title: context.l10n.timeCapital,
                icon: Icons.access_time_outlined,
                subTitle: cubit.state.data.time != null
                    ? context.l10n.scheduled
                    : context.l10n.schedule,
                value: cubit.state.data.time != null
                    ? cubit.state.data.time!.format(context)
                    : context.l10n.selectTime,
                onTap: () async {
                  final time = await showTimePicker(
                    context: context,
                    initialTime: cubit.state.data.time ?? TimeOfDay.now(),
                  );
                  if (time != null) {
                    cubit.pickTime(time);
                  }
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

class PickCard extends StatelessWidget {
  const PickCard({
    super.key,
    required this.title,
    required this.icon,
    required this.subTitle,
    required this.value,
    required this.onTap,
  });
  final String title;
  final IconData icon;
  final String subTitle;
  final String value;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              title,
              style: AppTextStyles.poppinsSemiBold16.copyWith(
                color: const Color(0xff64748B),
              ),
            ),
          ),

          const SizedBox(height: 12),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xffF1F5F9)),
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: .1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    icon,
                    color: AppColors.primary,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  subTitle,
                  style: AppTextStyles.poppinsMedium16.copyWith(
                    color: const Color(0xff64748B),
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  value,
                  style: AppTextStyles.poppinsSemiBold18,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
