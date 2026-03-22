import 'package:flutter/material.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/features/booking/domain/entities/guider_entities/guide_details_entity.dart';
import 'package:guide_me/features/booking/presentation/widgets/guide_profile_widgets/guide_certifications_section.dart';
import 'package:guide_me/features/booking/presentation/widgets/guide_profile_widgets/guide_comments_section.dart';
import 'package:guide_me/features/booking/presentation/widgets/guide_profile_widgets/guide_contact_info_section.dart';
import 'package:guide_me/features/booking/presentation/widgets/guide_profile_widgets/guide_professional_details_section.dart';
import 'package:guide_me/features/booking/presentation/widgets/guide_profile_widgets/guide_profile_header_section.dart';

class GuideDataSection extends StatelessWidget {
  const GuideDataSection({super.key, required this.guide});

  final GuideDetailsEntity guide;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        left: 20.p,
        right: 20.p,
        bottom: MediaQuery.of(context).padding.bottom,
      ),
      physics: const ClampingScrollPhysics(),
      child: Column(
        children: [
          const SizedBox(height: 16),

          GuideProfileHeaderSection(guide: guide),

          const SizedBox(height: 20),

          GuideContactInfoSection(guide: guide),

          const SizedBox(height: 20),

          GuideProfessionalDetailsSection(guide: guide),

          const SizedBox(height: 20),

          GuideCertificationsSection(guide: guide),

          const SizedBox(height: 4),

          GuideCommentsSection(guide: guide),
        ],
      ),
    );
  }
}
