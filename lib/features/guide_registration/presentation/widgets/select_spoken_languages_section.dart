import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/guide_registration/presentation/cubits/spoken_languages_cubit/spoken_languages_cubit.dart';
import 'package:guide_me/features/guide_registration/presentation/widgets/add_language.dart';
import 'package:guide_me/features/guide_registration/presentation/widgets/language_chip.dart';

class SelectSpokenLanguagesSection extends StatelessWidget {
  const SelectSpokenLanguagesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.spokenLanguages,
          style: AppTextStyles.poppinsMedium16,
        ),

        const SizedBox(height: 18),

        BlocSelector<SpokenLanguagesCubit, SpokenLanguagesState, List<String>>(
          selector: (state) => state.showedLanguages,
          builder: (context, showedLanguages) {
            return Wrap(
              spacing: 8,
              children: [
                ...showedLanguages.map(
                  (language) => LanguageChip(language: language),
                ),

                const AddLanguage(),
              ],
            );
          },
        ),
      ],
    );
  }
}
