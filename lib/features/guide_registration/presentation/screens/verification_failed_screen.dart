import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/app_assets/app_lotties.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/features/guide_registration/presentation/widgets/verification_failed_widgets/verification_issue_section.dart';
import 'package:lottie/lottie.dart';

class VerificationFailedScreen extends StatelessWidget {
  const VerificationFailedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFCFAF8),
      appBar: AppBar(
        backgroundColor: const Color(0xffFCFAF8),
        title: Text(
          context.l10n.onboarding,
          style: AppTextStyles.poppinsSemiBold20,
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.p),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      // Image
                      Lottie.asset(
                        AppLotties.cancelBubbles,
                        height: 150.h,
                      ),

                      const SizedBox(height: 16),

                      Text(
                        context.l10n.actionRequired,
                        style: AppTextStyles.poppinsSemiBold24,
                      ),

                      const SizedBox(height: 16),

                      Text(
                        context.l10n.verificationFailedMessage,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.poppinsLight18.copyWith(
                          color: const Color(0xff9C7A49),
                        ),
                      ),

                      const SizedBox(height: 28),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          context.l10n.issuesFound,
                          style: AppTextStyles.poppinsSemiBold14.copyWith(
                            color: const Color(0xff9C7A49),
                          ),
                        ),
                      ),

                      const SizedBox(height: 14),

                      const VerificationIssueSection(),
                    ],
                  ),

                  Column(
                    children: [
                      const SizedBox(height: 16),

                      Text(
                        context.l10n.viewDocumentGuidelines,
                        style: AppTextStyles.poppinsLight14.copyWith(
                          color: const Color(0xff9C7A49),
                        ),
                      ),

                      const SizedBox(height: 24),

                      AppButton(
                        onPressed: () {
                          context.go(AppRoutes.guideProfessionalInfoScreen);
                        },
                        text: context.l10n.updateDocuments,
                        radius: 15,
                        height: 48.h,
                      ),

                      const SizedBox(height: 30),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
