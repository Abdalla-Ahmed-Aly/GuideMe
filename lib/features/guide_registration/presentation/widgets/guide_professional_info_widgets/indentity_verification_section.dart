import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/app_assets/app_icons.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/shared/models/picked_file_model.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/guide_registration/presentation/cubits/guide_registration_shared_cubit/guide_registration_shared_cubit.dart';
import 'package:guide_me/features/guide_registration/presentation/cubits/guide_registration_shared_cubit/guide_registration_shared_state.dart';
import 'package:guide_me/features/guide_registration/presentation/widgets/guide_professional_info_widgets/verification_document_card.dart';

class IndentityVerificationSection extends StatelessWidget {
  const IndentityVerificationSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      GuideRegistrationSharedCubit,
      GuideRegistrationSharedState
    >(
      builder: (context, state) {
        if (state is GuideRegistrationFormData) {
          final nationalIdFront =
              (state.model.nationalId.isNotEmpty &&
                  state.model.nationalId[0] != null)
              ? state.model.nationalId[0]
              : null;
          final nationalIdBack =
              (state.model.nationalId.length > 1 &&
                  state.model.nationalId[1] != null)
              ? state.model.nationalId[1]
              : null;
          final guideLicense = state.model.guideLicense;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.l10n.identityVerification,
                style: AppTextStyles.poppinsSemiBold16,
              ),

              const SizedBox(height: 20),

              nationalIdFront != null
                  ? _buildPreview(
                      nationalIdFront,
                      context.l10n.nationalIdFrontSide,
                      () => context
                          .read<GuideRegistrationSharedCubit>()
                          .removeNationalId(0),
                    )
                  : VerificationDocumentCard(
                      title: context.l10n.nationalIdFrontSide,
                      hint: context.l10n.nationalIdHint,
                      svgIcon: AppIcons.idCard,
                      onTap: () {
                        context
                            .read<GuideRegistrationSharedCubit>()
                            .pickNationalId(0);
                      },
                    ),

              const SizedBox(height: 20),

              nationalIdBack != null
                  ? _buildPreview(
                      nationalIdBack,
                      context.l10n.nationalIdBackSide,
                      () => context
                          .read<GuideRegistrationSharedCubit>()
                          .removeNationalId(1),
                    )
                  : VerificationDocumentCard(
                      title: context.l10n.nationalIdBackSide,
                      hint: context.l10n.nationalIdHint,
                      svgIcon: AppIcons.idCard,
                      onTap: () {
                        context
                            .read<GuideRegistrationSharedCubit>()
                            .pickNationalId(1);
                      },
                    ),

              const SizedBox(height: 20),

              guideLicense != null
                  ? _buildPreview(
                      guideLicense,
                      context.l10n.tourGuideLicense,
                      () => context
                          .read<GuideRegistrationSharedCubit>()
                          .removeGuideLicense(),
                    )
                  : VerificationDocumentCard(
                      title: context.l10n.tourGuideLicense,
                      hint: context.l10n.tourGuideLicenseHint,
                      svgIcon: AppIcons.diploma, // TODO: change icon
                      onTap: () {
                        context
                            .read<GuideRegistrationSharedCubit>()
                            .pickGuideLicense();
                      },
                    ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildPreview(
    PickedFileModel file,
    String title,
    VoidCallback onDelete,
  ) {
    final isImage =
        file.name.toLowerCase().endsWith('.jpg') ||
        file.name.toLowerCase().endsWith('.jpeg') ||
        file.name.toLowerCase().endsWith('.png');

    return Container(
      width: double.infinity,
      height: 160,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xffE8D8C4),
          width: 2,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Stack(
          children: [
            Positioned.fill(
              child: isImage
                  ? (file.path != null && file.path!.startsWith('http')
                        ? Image.network(
                            file.path!,
                            fit: BoxFit.cover,
                          )
                        : Image.file(
                            File(file.path!),
                            fit: BoxFit.fitHeight,
                          ))
                  : Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.insert_drive_file,
                            size: 48,
                            color: Color(0xffF2930D),
                          ),
                          const SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              file.name,
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffA38354),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.6),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: GestureDetector(
                onTap: onDelete,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
