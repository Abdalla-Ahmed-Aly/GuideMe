import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'profile_language_chip.dart';
import 'profile_title_section.dart';

class ProfileLanguagesSection extends StatelessWidget {
  const ProfileLanguagesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.p, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileTitleSection(
            title: context.l10n.languages,
            onAddPressed: () {},
            onEditPressed: () {},
          ),

          const SizedBox(height: 16),

          // Languages list
          const Wrap(
            spacing: 8,
            children: [
              ProfileLanguageChip(),
              ProfileLanguageChip(),
              ProfileLanguageChip(),
              ProfileLanguageChip(),
            ],
          ),
        ],
      ),
    );
  }
}
