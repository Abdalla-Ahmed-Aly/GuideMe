import 'package:flutter/material.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/shared/entities/user_entity.dart';
import 'package:guide_me/features/guide_profile/presentation/widgets/tour_guide_widgets/about_section.dart';
import 'package:guide_me/features/guide_profile/presentation/widgets/tour_guide_widgets/profile_certifications_section.dart';
import 'package:guide_me/features/guide_profile/presentation/widgets/tour_guide_widgets/profile_languages_section.dart';
import 'package:guide_me/features/guide_profile/presentation/widgets/tour_guide_widgets/professional_details_section.dart';
import 'package:guide_me/features/guide_profile/presentation/widgets/tour_guide_widgets/tour_guide_profile_header.dart';

class TourGuideProfileBody extends StatelessWidget {
  final UserEntity user;
  const TourGuideProfileBody({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 12),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.p),
            child:  TourGuideProfileHeader(user: user), 
          ),

          const SizedBox(height: 20),

          // Line
          const CustomLine(),

          AboutSection(user: user),

          const Divider(
            color: Color(0xffF1F5F9),
            height: 1,
            thickness: 1,
          ),

          ProfessionalDetailsSection(user: user),

          const Divider(
            color: Color(0xffF1F5F9),
            height: 1,
            thickness: 1,
          ),

          ProfileLanguagesSection(user: user),

          const Divider(
            color: Color(0xffF1F5F9),
            height: 1,
            thickness: 1,
          ),

          ProfileCertificationsSection(user: user),
        ],
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
