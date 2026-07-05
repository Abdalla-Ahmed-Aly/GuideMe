import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/constants/spoken_languages_constants.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/features/guide_registration/presentation/cubits/guide_registration_shared_cubit/guide_registration_shared_cubit.dart';
import 'package:guide_me/features/guide_registration/presentation/cubits/guide_registration_shared_cubit/guide_registration_shared_state.dart';

class AddLanguageDialog extends StatefulWidget {
  const AddLanguageDialog({super.key});

  @override
  State<AddLanguageDialog> createState() => _AddLanguageDialogState();
}

class _AddLanguageDialogState extends State<AddLanguageDialog> {
  List<String> tempSelectedLanguages = [];
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<GuideRegistrationSharedCubit>();
    final availableLanguages = SpokenLanguagesConstants.languages;
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text(context.l10n.addLanguage),
      content: Wrap(
        spacing: 8,
        children: [
          ...availableLanguages.map(
            (language) {
              final tempSelected = tempSelectedLanguages.contains(language);
              final cubitSelected = cubit.state is GuideRegistrationFormData && 
                      (cubit.state as GuideRegistrationFormData).model.languages.contains(language);

              final isSelected = tempSelected || cubitSelected;

              return FilterChip(
                selected: isSelected,
                onSelected: (_) {
                  setState(() {
                    if (isSelected) {
                      cubit.toggleLanguage(language);
                    } else if (tempSelected) {
                      tempSelectedLanguages.remove(language);
                    } else {
                      tempSelectedLanguages.add(language);
                    }
                  });
                },
                label: Text(language),
                labelStyle: AppTextStyles.poppinsMedium16.copyWith(
                  color: isSelected ? Colors.white : Colors.black,
                ),
                selectedColor: const Color(0xffF2930D),
                backgroundColor: Colors.white,
                checkmarkColor: Colors.white,
                showCheckmark: true,
                padding: const EdgeInsets.symmetric(horizontal: 6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(
                    color: isSelected
                        ? const Color(0xffF2930D)
                        : const Color(0xffF2EDE5),
                    width: 2,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            context.pop();
          },
          child: Text(
            context.l10n.cancel,
            style: AppTextStyles.poppinsMedium16.copyWith(
              color: Colors.black,
            ),
          ),
        ),
        AppButton(
          width: 100.w,
          height: 34,
          radius: 20,
          onPressed: () {
            context.pop(tempSelectedLanguages);
          },
          text: context.l10n.add,
        ),
      ],
    );
  }
}
