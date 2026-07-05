import 'package:flutter/material.dart';
import 'package:guide_me/core/constants/hive_constants.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/utils/hive_helper.dart';

class NotificationSwitch extends StatefulWidget {
  const NotificationSwitch({super.key});

  @override
  State<NotificationSwitch> createState() => _NotificationSwitchState();
}

class _NotificationSwitchState extends State<NotificationSwitch> {
  bool allowNotifications = true;

  @override
  void initState() {
    super.initState();
    allowNotifications = HiveHelper.get<bool>(
          boxName: HiveConstants.notificationBox,
          key: HiveConstants.notificationKey,
        ) ??
        true;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          context.l10n.pushNotifications,
          style: AppTextStyles.poppinsRegular18,
        ),

        // Switch
        Switch(
          value: allowNotifications,
          onChanged: (value) {
            setState(() {
              allowNotifications = value;
            });
            HiveHelper.put<bool>(
              boxName: HiveConstants.notificationBox,
              key: HiveConstants.notificationKey,
              data: value,
            );
          },
          activeThumbColor: AppColors.white,
          activeTrackColor: AppColors.primary,
          inactiveThumbColor: AppColors.primary,
          inactiveTrackColor: AppColors.white,
          trackOutlineColor: const WidgetStatePropertyAll(AppColors.primary),
        ),
      ],
    );
  }
}
