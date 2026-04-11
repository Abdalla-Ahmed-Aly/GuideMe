import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/features/guide_registration/presentation/widgets/availability_and_pricing_widgets/cities_selector_section.dart';
import 'package:guide_me/features/guide_registration/presentation/widgets/availability_and_pricing_widgets/guide_working_hours.dart';
import 'package:guide_me/features/guide_registration/presentation/widgets/availability_and_pricing_widgets/pricing_section.dart';
import 'package:guide_me/features/guide_registration/presentation/widgets/availability_and_pricing_widgets/weekly_schedule_list.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/features/guide_registration/presentation/cubits/guide_registration_shared_cubit/guide_registration_shared_cubit.dart';
import 'package:guide_me/features/guide_registration/presentation/cubits/guide_registration_shared_cubit/guide_registration_shared_state.dart';
import '../widgets/availability_and_pricing_widgets/availability_and_pricing_header.dart';

class GuideAvailabilityAndPricingScreen extends StatelessWidget {
  const GuideAvailabilityAndPricingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F7F5),
      appBar: AppBar(
        backgroundColor: const Color(0xffF8F7F5),
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
        builder: (context, constraints) => SingleChildScrollView(
          clipBehavior: Clip.none,
          padding: EdgeInsets.symmetric(horizontal: 18.p),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12),
                    // Header
                    const AvailabilityAndPricingHeader(),

                    const SizedBox(height: 32),

                    Text(
                      context.l10n.availabilityPricingTitle,
                      style: AppTextStyles.poppinsMedium20,
                    ),

                    const SizedBox(height: 14),

                    Text(
                      context.l10n.availabilityPricingDescription,
                      style: AppTextStyles.poppinsLight16,
                    ),

                    const SizedBox(height: 14),

                    const PricingSection(),

                    const SizedBox(height: 26),

                    const CitiesSelectorSection(),

                    const SizedBox(height: 26),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          context.l10n.weeklySchedule,
                          style: AppTextStyles.poppinsMedium16,
                        ),
                        Text(
                          context.l10n.selectDays,
                          style: AppTextStyles.poppinsRegular14.copyWith(
                            color: const Color(0xffF2920A),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 22),

                    SizedBox(
                      height: 50.h,
                      child: const WeeklyScheduleList(),
                    ),

                    const SizedBox(height: 24),

                    const GuideWorkingHours(),

                    const SizedBox(height: 16),
                  ],
                ),

                // save & continue button
                Padding(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: BlocConsumer<GuideRegistrationSharedCubit, GuideRegistrationSharedState>(
                    listener: (context, state) {
                      if (state is GuideRegistrationSuccess) {
                        context.go(AppRoutes.guideVerificationScreen);
                      } else if (state is GuideRegistrationError) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.message)),
                        );
                      }
                    },
                    builder: (context, state) {
                      return AppButton(
                        text: context.l10n.saveAndContinue,
                        radius: 24.r,
                        height: 48.h,
                        isLoading: state is GuideRegistrationLoading,
                        onPressed: () {
                          context.read<GuideRegistrationSharedCubit>().submitOnboarding();
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
