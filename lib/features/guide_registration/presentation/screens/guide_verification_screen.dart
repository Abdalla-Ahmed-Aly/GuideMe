import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/app_assets/app_icons.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/guide_registration/presentation/widgets/setup_progress_header.dart';
import 'package:guide_me/features/guide_registration/presentation/widgets/verification_document_tile.dart';

class GuideVerificationScreen extends StatelessWidget {
  const GuideVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F0E7),
      appBar: AppBar(
        backgroundColor: const Color(0xffF7F0E7),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            context.pop();
          },
        ),
        title: Text(
          context.l10n.onboarding,
          style: AppTextStyles.poppinsSemiBold20,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 18.p),
        child: Column(
          children: [
            const SizedBox(height: 12),
            // header
            SetupProgressHeader(
              currentStep: 4,
              percentage: 100,
              title: context.l10n.onboardingProgress,
            ),

            const SizedBox(height: 26),

            // image
            Image.asset(
              AppImages.guideVerification,
              height: 300.h,
            ),

            const SizedBox(height: 24),

            Text(
              context.l10n.verificationInProgress,
              style: AppTextStyles.poppinsSemiBold20,
            ),

            const SizedBox(height: 8),

            Text(
              context.l10n.verificationDescription,
              textAlign: TextAlign.center,
              style: AppTextStyles.poppinsLight20,
            ),

            const SizedBox(height: 8),

            _buildVerificationDocuments(context),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Container _buildVerificationDocuments(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xff686868).withValues(alpha: .35),
        ),
        color: Colors.white,
      ),
      child: Column(
        children: [
          VerificationDocumentTile(
            svgIcon: AppIcons.idCard,
            title: context.l10n.nationalId,
          ),
          const SizedBox(height: 16),
          VerificationDocumentTile(
            svgIcon: AppIcons.certificateIcon,
            title: context.l10n.tourGuideLicense,
          ),
          const SizedBox(height: 16),
          VerificationDocumentTile(
            svgIcon: AppIcons.userOutline,
            title: context.l10n.profileInformation,
          ),
        ],
      ),
    );
  }
}
