import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/guide_registration/presentation/cubits/spoken_languages_cubit/spoken_languages_cubit.dart';

class LanguageChip extends StatelessWidget {
  const LanguageChip({
    super.key,
    required this.language,
  });
  final String language;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SpokenLanguagesCubit, SpokenLanguagesState, bool>(
      selector: (state) {
        return state.selectedLanguages.contains(language);
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
            context.read<SpokenLanguagesCubit>().toggleLanguage(language);
          },
        );
      },
    );
  }
}
