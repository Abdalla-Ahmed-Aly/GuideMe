import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guide_me/core/app_assets/app_icons.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/shared/entities/certificate_entity.dart';
import 'package:guide_me/core/shared/entities/user_entity.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/guide_profile/presentation/cubits/add_certification_cubit/add_certification_cubit.dart';
import 'package:guide_me/features/guide_profile/presentation/cubits/guide_profile_cubit/guide_profile_cubit.dart';
import 'package:guide_me/features/guide_profile/presentation/widgets/tour_guide_widgets/delete_certificate_dialog.dart';

class ProfileCertificationCard extends StatefulWidget {
  const ProfileCertificationCard({
    super.key,
    required this.certification,
    required this.user,
  });
  final CertificateEntity certification;
  final UserEntity user;

  @override
  State<ProfileCertificationCard> createState() =>
      _ProfileCertificationCardState();
}

class _ProfileCertificationCardState extends State<ProfileCertificationCard> {
  @override
  Widget build(BuildContext context) {
    final deleteCertificateCubit = context.read<AddCertificationCubit>();
    final cubit = context.read<GuideProfileCubit>();
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
                  key: ValueKey(cubit.certificationInEditMode),
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),

                    Expanded(
                      child: Text(
                        widget.certification.name.toString().trim(),
                        style: AppTextStyles.interBold16,
                      ),
                    ),

                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: cubit.certificationInEditMode
                          ? GestureDetector(
                              onTap: () {
                                showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) {
                                    return BlocProvider.value(
                                      value: deleteCertificateCubit,
                                      child: DeleteCertificateDialog(
                                        userId: widget.user.id,
                                        certificationId:
                                            widget.certification.id,
                                      ),
                                    );
                                  },
                                );
                              },
                              child: const Icon(
                                key: ValueKey("delete"),
                                Icons.delete_outline_rounded,
                                color: Colors.red,
                              ),
                            )
                          : null,
                    ),
                  ],
                ),

                Text(
                  widget.certification.organization.toString().trim(),
                  style: AppTextStyles.interRegular14.copyWith(
                    color: const Color(0xffB59A64),
                  ),
                ),

                Row(
                  children: [
                    Text(
                      "${context.l10n.issued.toString().trim()} ${widget.certification.issueDate.toString().trim()}",
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

                    if (widget.certification.expirationDate != null)
                      Text(
                        "${context.l10n.validUntil.toString().trim()} ${widget.certification.expirationDate.toString().trim()}",
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
