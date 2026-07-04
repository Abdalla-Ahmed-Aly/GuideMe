import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/shared/entities/user_entity.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/booking/presentation/widgets/guide_profile_widgets/certificate_list_view.dart';

class GuideCertificationsSection extends StatelessWidget {
  const GuideCertificationsSection({
    super.key,
    required this.guide,
  });

  final UserEntity guide;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.certifications,
          style: AppTextStyles.interSemiBold20.copyWith(
            color: AppColors.black,
          ),
        ),

        const SizedBox(height: 14),

        if (guide.certificates.isEmpty) ...[
          SizedBox(
            height: 100.h,
            child: Center(
              child: Text(
                context.l10n.noCertifications,
                style: AppTextStyles.interRegular14.copyWith(
                  color: AppColors.black,
                ),
              ),
            ),
          ),
        ] else ...[
          CertificateListView(certificates: guide.certificates),
        ],
      ],
    );
  }
}
