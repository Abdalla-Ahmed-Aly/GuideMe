import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/guide_registration/presentation/cubits/guide_registration_shared_cubit/guide_registration_shared_cubit.dart';
import 'package:guide_me/features/guide_registration/presentation/cubits/guide_registration_shared_cubit/guide_registration_shared_state.dart';
import 'package:guide_me/features/guide_registration/presentation/widgets/guide_expertise_widgets/add_language.dart';
import 'package:guide_me/features/guide_registration/presentation/widgets/guide_expertise_widgets/language_chip.dart';

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

        BlocSelector<GuideRegistrationSharedCubit, GuideRegistrationSharedState, List<String>>(
          selector: (state) {
            if (state is GuideRegistrationFormData) {
               return state.model.languages;
            }
            return const [];
          },
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
