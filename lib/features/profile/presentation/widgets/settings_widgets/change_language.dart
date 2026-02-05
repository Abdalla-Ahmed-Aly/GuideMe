import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class ChangeLanguage extends StatefulWidget {
  const ChangeLanguage({super.key});

  @override
  State<ChangeLanguage> createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {
  int groupValue = 1;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return RadioGroup<int>(
      groupValue: groupValue,
      onChanged: (value) {
        setState(() {
          groupValue = value!;
        });
      },
      child: Row(
        children: [
          Text(
            context.l10n.language,
            style: AppTextStyles.poppinsRegular18,
          ),

          const Spacer(),

          // English
          SizedBox(
            width: context.isPortrait ? size.width * 0.3 : size.height * 0.3,
            child: RadioListTile(
              contentPadding: EdgeInsets.zero,
              dense: true,
              visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
              fillColor: const WidgetStatePropertyAll(AppColors.primary),
              value: 1,
              title: Text(
                context.l10n.english,
                style: AppTextStyles.poppinsLight16,
              ),
            ),
          ),

          // Arabic
          SizedBox(
            width: context.isPortrait ? size.width * 0.3 : size.height * 0.3,
            child: RadioListTile(
              dense: true,
              visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
              contentPadding: EdgeInsets.zero,
              fillColor: const WidgetStatePropertyAll(AppColors.primary),
              value: 2,
              title: Text(
                context.l10n.arabic,
                style: AppTextStyles.poppinsLight16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
