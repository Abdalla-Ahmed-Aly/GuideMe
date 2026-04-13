import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/shared/enums/user_role.dart';
import 'package:guide_me/core/services/hive_service.dart';
import 'package:guide_me/features/auth/presentation/widgets/role_selection_widgets/role_selection_card.dart';

class ChooseRoleScreen extends StatefulWidget {
  const ChooseRoleScreen({super.key});

  @override
  State<ChooseRoleScreen> createState() => _ChooseRoleScreenState();
}

class _ChooseRoleScreenState extends State<ChooseRoleScreen> {
  UserRole? selectedRole;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.primary),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              
              Text(
                context.l10n.chooseYourRole,
                style: AppTextStyles.poppinsBold32.copyWith(
                  color: AppColors.primary,
                ),
              ),
              
              const SizedBox(height: 12),
              
              Text(
                "Please select your role to provide you with the best experience",
                style: AppTextStyles.poppinsRegular16.copyWith(
                  color: AppColors.natural6,
                ),
              ),

              const SizedBox(height: 40),

              RoleSelectionCard(
                role: UserRole.tourist,
                isSelected: selectedRole == UserRole.tourist,
                title: context.l10n.tourist,
                icon: Icons.person_pin_circle_outlined,
                onTap: () {
                  setState(() => selectedRole = UserRole.tourist);
                  HiveService.saveUserRole(UserRole.tourist);
                  // Immediate navigation
                  Future.delayed(const Duration(milliseconds: 400), () {
                    if (mounted) context.push(AppRoutes.selectInterestsScreen);
                  });
                },
              ),

              const SizedBox(height: 16),

              RoleSelectionCard(
                role: UserRole.guide,
                isSelected: selectedRole == UserRole.guide,
                title: context.l10n.tourGuide,
                icon: Icons.explore_outlined,
                onTap: () {
                  setState(() => selectedRole = UserRole.guide);
                  HiveService.saveUserRole(UserRole.guide);
                  // Immediate navigation
                  Future.delayed(const Duration(milliseconds: 400), () {
                    if (mounted) context.push(AppRoutes.guideProfessionalInfoScreen);
                  });
                },
              ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
