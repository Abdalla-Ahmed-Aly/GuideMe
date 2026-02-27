import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/features/guide_registration/presentation/widgets/guide_expertise_widgets/expertise_area_grid_view.dart';
import 'package:guide_me/features/guide_registration/presentation/widgets/guide_expertise_widgets/select_spoken_languages_section.dart';
import 'package:guide_me/features/guide_registration/presentation/widgets/setup_progress_header.dart';

class GuideExpertiseScreen extends StatelessWidget {
  const GuideExpertiseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 18.p),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 12),
                      // header
                      SetupProgressHeader(
                        currentStep: 2,
                        percentage: 50,
                        title: context.l10n.expertiseSetupTitle,
                      ),

                      const SizedBox(height: 26),

                      Text(
                        context.l10n.expertiseLanguagesTitle,
                        style: AppTextStyles.poppinsMedium20,
                      ),

                      const SizedBox(height: 14),

                      Text(
                        context.l10n.expertiseDescription,
                        style: AppTextStyles.poppinsLight16,
                      ),

                      const SizedBox(height: 22),

                      const SelectSpokenLanguagesSection(),

                      const SizedBox(height: 28),

                      Text(
                        context.l10n.areasOfExpertise,
                        style: AppTextStyles.poppinsMedium16,
                      ),

                      const SizedBox(height: 16),

                      const ExpertiseAreaGridView(),
                      const SizedBox(height: 16),
                    ],
                  ),

                  // continue button
                  Padding(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: AppButton(
                      text: context.l10n.continueText,
                      radius: 24.r,
                      height: 48.h,
                      onPressed: () {
                        context.push(
                          AppRoutes.guideAvailabilityAndPricingScreen,
                        );
                      },
                    ),
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
