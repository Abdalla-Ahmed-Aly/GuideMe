import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/features/guide_registration/presentation/widgets/verification_success_widgets/account_status_card.dart';
import 'package:guide_me/features/guide_registration/presentation/widgets/verification_success_widgets/info_status_card.dart';
import 'package:guide_me/features/guide_registration/presentation/widgets/verification_success_widgets/verification_success_header.dart';

class GuideVerificationSuccessScreen extends StatelessWidget {
  const GuideVerificationSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F7F5),
      appBar: AppBar(
        backgroundColor: const Color(0xffF8F7F5),
        title: Text(
          context.l10n.onboarding,
          style: AppTextStyles.poppinsSemiBold20,
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // body
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22.p),
                    child: Column(
                      children: [
                        const SizedBox(height: 18),
                        const VerificationSuccessHeader(),

                        const SizedBox(height: 20),

                        Text(
                          context.l10n.congratulations,
                          style: AppTextStyles.poppinsSemiBold20,
                        ),

                        const SizedBox(height: 12),

                        Text(
                          context.l10n.verificationSuccessMessage,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.poppinsLight20,
                        ),

                        const SizedBox(height: 16),

                        const AccountStatusCard(),

                        const SizedBox(height: 12),

                        Row(
                          children: [
                            Expanded(
                              child: InfoStatusCard(
                                icon: Icons.calendar_today,
                                title: context.l10n.memberSince,
                                subtitle: "OCT 2026",
                              ),
                            ),

                            const SizedBox(width: 16),

                            Expanded(
                              child: InfoStatusCard(
                                icon: Icons.check_circle_outline_rounded,
                                title: context.l10n.identity,
                                subtitle: context.l10n.fullAccess,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),
                      ],
                    ),
                  ),

                  // Button
                  Column(
                    children: [
                      const Divider(
                        color: Color(0xffD9D9D9),
                        thickness: 1,
                        height: 1,
                      ),

                      const SizedBox(height: 12),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 28.p),
                        child: AppButton(
                          onPressed: () {},
                          text: context.l10n.continueButton,
                          radius: 15,
                          height: 48.h,
                        ),
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
