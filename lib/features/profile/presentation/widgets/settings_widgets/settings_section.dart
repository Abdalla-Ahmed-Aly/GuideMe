import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/features/profile/presentation/widgets/settings_widgets/change_language.dart';
import 'package:guide_me/features/profile/presentation/widgets/settings_widgets/notification_switch.dart';
import 'package:guide_me/features/profile/presentation/widgets/settings_widgets/settings_tile.dart';

class SettingsSection extends StatelessWidget {
  const SettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
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
                  const SizedBox(height: 14),

                  // Image & Name
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.p),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 27,
                          backgroundImage: ExactAssetImage(
                            AppImages.profileImageTest,
                          ),
                        ),

                        const SizedBox(width: 22),

                        Expanded(
                          child: Text(
                            'John Doe',
                            style: AppTextStyles.poppinsSemiBold18,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 18),

                  // Account settings
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.p),
                    child: Text(
                      context.l10n.accountSettings,
                      style: AppTextStyles.poppinsRegular18.copyWith(
                        color: AppColors.natural4,
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Edit Profile
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.p),
                    child: SettingsTile(
                      title: context.l10n.editProfile,
                      icon: Icons.arrow_forward_ios,
                      onTap: () {
                        context.push(AppRoutes.editProfileScreen);
                      },
                    ),
                  ),

                  const SizedBox(height: 28),

                  // Add Payment Method
                  Padding(
                    padding: EdgeInsets.only(left: 32.p, right: 30.p),
                    child: SettingsTile(
                      title: context.l10n.addPaymentMethod,
                      icon: Icons.add,
                      iconSize: 26,
                      onTap: () {
                        context.push(AppRoutes.addPaymentMethodScreen);
                      },
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Language
                  Padding(
                    padding: EdgeInsets.only(
                      left: 32.p,
                      right: context.isLandscape ? 30.p : 0,
                    ),
                    child: const ChangeLanguage(),
                  ),

                  const SizedBox(height: 14),

                  // Notifications
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.p),
                    child: const NotificationSwitch(),
                  ),
                ],
              ),

              // Logout
              Padding(
                padding: EdgeInsets.only(
                  left: 30.p,
                  right: 30.p,
                  bottom: 34,
                  top: 16,
                ),
                child: AppButton(
                  onPressed: () {},
                  text: context.l10n.logout,
                  backgroundColor: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
