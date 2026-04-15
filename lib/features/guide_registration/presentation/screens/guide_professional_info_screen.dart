import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/core/widgets/custom_text_field.dart';
import 'package:guide_me/features/guide_registration/presentation/cubits/guide_registration_shared_cubit/guide_registration_shared_state.dart';
import 'package:guide_me/features/guide_registration/presentation/widgets/guide_professional_info_widgets/profile_photo_section.dart';
import '../widgets/guide_professional_info_widgets/indentity_verification_section.dart';
import '../widgets/setup_progress_header.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/features/guide_registration/presentation/cubits/guide_registration_shared_cubit/guide_registration_shared_cubit.dart';

class GuideProfessionalInfoScreen extends StatefulWidget {
  const GuideProfessionalInfoScreen({super.key});

  @override
  State<GuideProfessionalInfoScreen> createState() => _GuideProfessionalInfoScreenState();
}

class _GuideProfessionalInfoScreenState extends State<GuideProfessionalInfoScreen> {
  late TextEditingController _yearsController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _yearsController = TextEditingController();

    // Initialize form with saved data
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<GuideRegistrationSharedCubit>().initForm();
    });
  }

  @override
  void dispose() {
    _yearsController.dispose();
    super.dispose();
  }

  bool _validateFiles(GuideRegistrationFormData state) {
    if (state.model.nationalId.isEmpty || state.model.nationalId[0] == null) {
      _showError("National ID (Front) is required");
      return false;
    }
    if (state.model.nationalId.length < 2 || state.model.nationalId[1] == null) {
      _showError("National ID (Back) is required");
      return false;
    }
    if (state.model.guideLicense == null) {
      _showError("Tour guide license is required");
      return false;
    }
    return true;
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GuideRegistrationSharedCubit, GuideRegistrationSharedState>(
      listener: (context, state) {
        if (state is GuideRegistrationFormData) {
          final years = state.model.yearsOfExperience > 0 ? state.model.yearsOfExperience.toString() : "";
          if (_yearsController.text != years) {
            _yearsController.text = years;
          }
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xffF8F7F5),
        appBar: AppBar(
          backgroundColor: const Color(0xffF8F7F5),
          title: Text(
            context.l10n.onboarding,
            style: AppTextStyles.poppinsSemiBold20,
          ),
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 18.p),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                // header
                SetupProgressHeader(
                  currentStep: 1,
                  percentage: 25,
                  title: context.l10n.onboarding,
                ),

                const SizedBox(height: 26),

                // verfication document section
                const IndentityVerificationSection(),

                const SizedBox(height: 34),

                _buildProfessionalHistory(context),

                const SizedBox(height: 18),

                Text(
                  context.l10n.verificationNote,
                  style: TextStyle(
                    fontSize: 14.fs,
                    color: const Color(0xffA38354),
                  ),
                ),

                const SizedBox(height: 24),

                // continue button
                BlocBuilder<GuideRegistrationSharedCubit, GuideRegistrationSharedState>(
                  builder: (context, state) {
                    return AppButton(
                      text: context.l10n.continueText,
                      radius: 24.r,
                      height: 48.h,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (state is GuideRegistrationFormData) {
                            if (_validateFiles(state)) {
                              context.push(AppRoutes.guideExpertiseScreen);
                            }
                          }
                        }
                      },
                    );
                  },
                ),

                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column _buildProfessionalHistory(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.professionalHistory,
          style: AppTextStyles.poppinsSemiBold18,
        ),

        const SizedBox(height: 16),

        Text(
          context.l10n.yearsOfExperience,
          style: AppTextStyles.poppinsRegular14,
        ),

        const SizedBox(height: 14),

        CustomTextField(
          controller: _yearsController,
          hintText: context.l10n.yearsOfExperienceHint,
          keyboardType: TextInputType.number,
          hintColor: const Color(0xffA38354),
          validator: (val) {
            if (val == null || val.isEmpty) {
              return "Years of experience is required";
            }
            final years = int.tryParse(val);
            if (years == null || years <= 0) {
              return "Please enter a valid number of years";
            }
            return null;
          },
          onChanged: (val) {
            final years = int.tryParse(val) ?? 0;
            context.read<GuideRegistrationSharedCubit>().setProfessionalInfo(yearsOfExperience: years);
          },
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Color(0xffA38354),
            ),
          ),
        ),
      ],
    );
  }
}
