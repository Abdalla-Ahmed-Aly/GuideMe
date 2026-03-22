import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/booking/domain/entities/guider_entities/guide_details_entity.dart';
import 'package:guide_me/features/booking/presentation/widgets/guide_profile_widgets/contact_info_tile.dart';

class GuideContactInfoSection extends StatelessWidget {
  const GuideContactInfoSection({super.key, required this.guide});

  final GuideDetailsEntity guide;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.contactInformation,
          style: AppTextStyles.interSemiBold20,
        ),

        const SizedBox(height: 14),

        ContactInfoTile(
          icon: Icons.phone,
          text: guide.phone,
        ),

        const SizedBox(height: 10),

        ContactInfoTile(
          icon: Icons.mail_outline,
          text: guide.email,
        ),
      ],
    );
  }
}
