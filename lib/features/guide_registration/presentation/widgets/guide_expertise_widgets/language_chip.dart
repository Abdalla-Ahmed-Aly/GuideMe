import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/guide_registration/presentation/cubits/guide_registration_shared_cubit/guide_registration_shared_cubit.dart';
import 'package:guide_me/features/guide_registration/presentation/cubits/guide_registration_shared_cubit/guide_registration_shared_state.dart';

class LanguageChip extends StatelessWidget {
  const LanguageChip({
    super.key,
    required this.language,
  });
  final String language;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<GuideRegistrationSharedCubit, GuideRegistrationSharedState, bool>(
      selector: (state) {
        if (state is GuideRegistrationFormData) {
          return state.model.languages.contains(language);
        }
        return false;
      },
      builder: (context, isSelected) {
        return FilterChip(
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
          backgroundColor: Colors.white,
          showCheckmark: true,
          checkmarkColor: Colors.white,
          selectedColor: const Color(0xffF2930D),
          selected: isSelected,
          label: Text(language),
          labelStyle: AppTextStyles.poppinsMedium16.copyWith(
            color: isSelected ? Colors.white : Colors.black,
          ),
          onSelected: (_) {
            context.read<GuideRegistrationSharedCubit>().toggleLanguage(language);
          },
        );
      },
    );
  }
}
