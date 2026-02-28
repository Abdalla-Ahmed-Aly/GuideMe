import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/app_assets/app_icons.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/guide_registration/presentation/cubits/professional_info_cubit/professional_info_cubit.dart';
import 'package:guide_me/features/guide_registration/presentation/widgets/guide_professional_info_widgets/verification_document_card.dart';

class IndentityVerificationSection extends StatelessWidget {
  const IndentityVerificationSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfessionalInfoCubit, ProfessionalInfoState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.l10n.identityVerification,
              style: AppTextStyles.poppinsSemiBold16,
            ),

            const SizedBox(height: 20),

            VerificationDocumentCard(
              title: state.nationalId.isNotEmpty
                  ? "${state.nationalId.first!.name}, ${state.nationalId.last!.name}"
                  : context.l10n.nationalId,
              hint: context.l10n.nationalIdHint,
              svgIcon: AppIcons.idCard,
              onTap: () {
                context.read<ProfessionalInfoCubit>().pickNationalId();
              },
            ),

            const SizedBox(height: 20),

            VerificationDocumentCard(
              title: state.tourGuideLicense != null
                  ? state.tourGuideLicense!.name
                  : context.l10n.tourGuideLicense,
              hint: context.l10n.tourGuideLicenseHint,
              svgIcon: AppIcons.diploma, // TODO: change icon
              onTap: () {
                context.read<ProfessionalInfoCubit>().pickTourGuideLicense();
              },
            ),
          ],
        );
      },
    );
  }
}
