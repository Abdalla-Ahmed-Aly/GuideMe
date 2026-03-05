import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'profile_certification_card.dart';
import 'profile_title_section.dart';

class ProfileCertificationsSection extends StatelessWidget {
  const ProfileCertificationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.p, vertical: 16),
      child: Column(
        children: [
          ProfileTitleSection(
            title: context.l10n.certifications,
            onAddPressed: () {
              context.push(AppRoutes.addCertificationScreen);
            },
            onEditPressed: () {},
          ),

          const SizedBox(height: 16),

          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemCount: 2,
            itemBuilder: (context, index) => const ProfileCertificationCard(),
          ),
        ],
      ),
    );
  }
}

