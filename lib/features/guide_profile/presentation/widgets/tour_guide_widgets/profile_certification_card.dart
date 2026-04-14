import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guide_me/core/app_assets/app_icons.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/shared/entities/certificate_entity.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

import '../../cubits/guide_profile_cubit/guide_profile_cubit.dart';

class ProfileCertificationCard extends StatelessWidget {
  const ProfileCertificationCard({super.key, required this.certification});
  final CertificateEntity certification;

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<GuideProfileCubit>();
    final inEditCertificationsMode = cubit.state.inEditCertificationsMode;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.primary2.withValues(alpha: 0.1),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.primary2.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(4),
            ),
            child: SvgPicture.asset(
              AppIcons.diploma,
              width: 20,
              height: 20,
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  key: ValueKey(cubit.state.inEditCertificationsMode),
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),

                    Expanded(
                      child: Text(
                        certification.name,
                        style: AppTextStyles.interBold16,
                      ),
                    ),

                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: inEditCertificationsMode
                              ? const Icon(
                                  key: ValueKey("edit"),
                                  Icons.edit_outlined,
                                  color: AppColors.primary2,
                                )
                              : null,
                        ),

                        const SizedBox(width: 8),

                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: inEditCertificationsMode
                              ? const Icon(
                                  key: ValueKey("edit"),
                                  Icons.delete_outline_rounded,
                                  color: AppColors.primary2,
                                )
                              : null,
                        ),
                      ],
                    ),
                  ],
                ),

                Text(
                  certification.organization,
                  style: AppTextStyles.interRegular14.copyWith(
                    color: const Color(0xffB59A64),
                  ),
                ),

                Row(
                  children: [
                    Text(
                      "${context.l10n.issued} ${certification.issueDate}",
                      style: AppTextStyles.interRegular12.copyWith(
                        color: const Color(0xff94A3B8),
                      ),
                    ),

                    Text(
                      " • ",
                      style: AppTextStyles.interRegular12.copyWith(
                        color: const Color(0xff94A3B8),
                      ),
                    ),

                    if (certification.expirationDate != null)
                      Text(
                        "${context.l10n.validUntil} ${certification.expirationDate}",
                        style: AppTextStyles.interRegular12.copyWith(
                          color: const Color(0xff94A3B8),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
