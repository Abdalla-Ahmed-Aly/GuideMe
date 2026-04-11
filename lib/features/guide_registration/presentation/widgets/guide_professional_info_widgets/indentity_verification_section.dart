import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/app_assets/app_icons.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
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
    return BlocBuilder<GuideRegistrationSharedCubit, GuideRegistrationSharedState>(
      builder: (context, state) {
        if (state is GuideRegistrationFormData) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.l10n.identityVerification,
                style: AppTextStyles.poppinsSemiBold16,
              ),
  
              const SizedBox(height: 20),
  
              VerificationDocumentCard(
                title: (state.model.nationalId.isNotEmpty && state.model.nationalId[0] != null)
                    ? state.model.nationalId[0]!.name
                    : "${context.l10n.nationalId} (Front Side)",
                hint: context.l10n.nationalIdHint,
                svgIcon: AppIcons.idCard,
                onTap: () {
                  context.read<GuideRegistrationSharedCubit>().pickNationalId(0);
                },
              ),
  
              const SizedBox(height: 20),

              VerificationDocumentCard(
                title: (state.model.nationalId.length > 1 && state.model.nationalId[1] != null)
                    ? state.model.nationalId[1]!.name
                    : "${context.l10n.nationalId} (Back Side)",
                hint: context.l10n.nationalIdHint,
                svgIcon: AppIcons.idCard,
                onTap: () {
                  context.read<GuideRegistrationSharedCubit>().pickNationalId(1);
                },
              ),
  
              const SizedBox(height: 20),
  
              VerificationDocumentCard(
                title: state.model.guideLicense != null
                    ? state.model.guideLicense!.name
                    : context.l10n.tourGuideLicense,
                hint: context.l10n.tourGuideLicenseHint,
                svgIcon: AppIcons.diploma, // TODO: change icon
                onTap: () {
                  context.read<GuideRegistrationSharedCubit>().pickGuideLicense();
                },
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
