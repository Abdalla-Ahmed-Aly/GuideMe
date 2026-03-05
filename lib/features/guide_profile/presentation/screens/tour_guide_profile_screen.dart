import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/app_assets/app_icons.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/guide_profile/presentation/widgets/tour_guide_widgets/about_section.dart';
import 'package:guide_me/features/guide_profile/presentation/widgets/tour_guide_widgets/profile_languages_section.dart';
import 'package:guide_me/features/guide_profile/presentation/widgets/tour_guide_widgets/professional_details_section.dart';

import '../widgets/tour_guide_widgets/profile_certifications_section.dart';
import '../widgets/tour_guide_widgets/tour_guide_profile_header.dart';

class TourGuideProfileScreen extends StatelessWidget {
  const TourGuideProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            context.pop();
          },
        ),
        title: Text(
          context.l10n.profile,
          style: AppTextStyles.poppinsSemiBold24,
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              AppIcons.settings,
              width: 24,
            ),
            onPressed: () {
              context.push(AppRoutes.settingsScreen);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 12),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.p),
              child: const TourGuideProfileHeader(),
            ),

            const SizedBox(height: 20),

            // Line
            const CustomLine(),

            const AboutSection(),

            const Divider(
              color: Color(0xffF1F5F9),
              height: 1,
              thickness: 1,
            ),

            const ProfessionalDetailsSection(),

            const Divider(
              color: Color(0xffF1F5F9),
              height: 1,
              thickness: 1,
            ),

            const ProfileLanguagesSection(),

            const Divider(
              color: Color(0xffF1F5F9),
              height: 1,
              thickness: 1,
            ),

            const ProfileCertificationsSection(),
          ],
        ),
      ),
    );
  }
}

class CustomLine extends StatelessWidget {
  const CustomLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 8,
      decoration: const BoxDecoration(
        color: Color(0xffF1F5F9),
      ),
    );
  }
}
