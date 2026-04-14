import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/shared/entities/user_entity.dart';
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
                    child: const AddLanguageBottomSheet(),
                  );
                },
              );
            },
            onEditPressed: () {
              context.read<GuideProfileCubit>().toggleLangEditMode();
            },
            inEditMode: context
                .watch<GuideProfileCubit>()
                .state
                .inEditLangusgesMode,
          ),

          const SizedBox(height: 16),

          // Languages list
          Wrap(
            spacing: 8,
            children: user.languages.map((language) {
              return ProfileLanguageChip(language: language);
            }).toList(),
          ),
        ],
      ),
    );
  }
}
