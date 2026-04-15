import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/shared/entities/user_entity.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/guide_profile/presentation/cubits/guide_profile_cubit/guide_profile_cubit.dart';
import 'add_language_bottom_sheet.dart';
import 'profile_language_chip.dart';
import 'profile_title_section.dart';

class ProfileLanguagesSection extends StatelessWidget {
  const ProfileLanguagesSection({super.key, required this.user});
  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<GuideProfileCubit>();
    return BlocBuilder<GuideProfileCubit, GuideProfileState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.p, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileTitleSection(
                title: context.l10n.languages,
                onAddPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      return BlocProvider.value(
                        value: cubit,
                        child: AddLanguageBottomSheet(
                          user: user,
                        ),
                      );
                    },
                  );
                },
                onEditPressed: () {
                  cubit.toggleLanguageEditMode();
                },
                inEditMode: cubit.languageInEditMode,
              ),

              const SizedBox(height: 16),

              // Languages list
              if (user.languages.isEmpty)
                SizedBox(
                  height: 40,
                  child: Center(
                    child: Text(
                      context.l10n.noLanguagesYet,
                      style: AppTextStyles.interBold16.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                )
              else
                Wrap(
                  spacing: 8,
                  children: user.languages.map((language) {
                    return ProfileLanguageChip(
                      language: language,
                      user: user,
                    );
                  }).toList(),
                ),
            ],
          ),
        );
      },
    );
  }
}
