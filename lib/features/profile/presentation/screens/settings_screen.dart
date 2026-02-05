import 'package:flutter/material.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/features/profile/presentation/widgets/settings_widgets/change_language.dart';
import 'package:guide_me/features/profile/presentation/widgets/settings_widgets/notification_switch.dart';
import 'package:guide_me/features/profile/presentation/widgets/settings_widgets/settings_app_bar.dart';
import 'package:guide_me/features/profile/presentation/widgets/settings_widgets/settings_tile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: context.isPortrait ? size.height * 0.05 : size.width * .05,
          ),

          // App bar
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.p),
            child: const SettingsAppBar(),
          ),

          const SizedBox(height: 22),

          // Image & Name
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.p),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 27,
                  backgroundImage: ExactAssetImage(AppImages.profileImageTest),
                ),

                const SizedBox(width: 22),

                Text(
                  'John Doe',
                  style: AppTextStyles.poppinsSemiBold18,
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
            ),
          ),

          const SizedBox(height: 24),

          // Language
          Padding(
            padding: EdgeInsets.only(left: 32.p),
            child: const ChangeLanguage(),
          ),

          const SizedBox(height: 14),

          // Notifications
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.p),
            child: const NotificationSwitch(),
          ),

          const Spacer(),

          // Logout
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30.p,
            ),
            child: AppButton(
              onPressed: () {},
              text: context.l10n.logout,
              backgroundColor: AppColors.primary700,
            ),
          ),

          const SizedBox(height: 34),
        ],
      ),
    );
  }
}
