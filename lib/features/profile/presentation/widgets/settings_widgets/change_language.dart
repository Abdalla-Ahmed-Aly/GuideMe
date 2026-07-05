import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/shared/cubits/locale_cubit/locale_cubit.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class ChangeLanguage extends StatelessWidget {
  const ChangeLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return RadioGroup<String>(
      groupValue: context.watch<LocaleCubit>().state.languageCode,
      onChanged: (value) {
        if (value != null) {
          context.read<LocaleCubit>().setLanguage(value);
        }
      },
      child: Row(
        children: [
          Text(
            context.l10n.language,
            style: AppTextStyles.poppinsRegular18,
          ),

          const Spacer(),

          // English
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Radio<String>(
                value: 'en',
                fillColor: WidgetStatePropertyAll(AppColors.primary),
              ),
              Text(context.l10n.english),
            ],
          ),

          // Arabic
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Radio<String>(
                value: 'ar',
                fillColor: WidgetStatePropertyAll(AppColors.primary),
              ),
              Text(context.l10n.arabic),
            ],
          ),
        ],
      ),
    );
  }
}
