import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/features/profile/presentation/widgets/settings_widgets/settings_app_bar.dart';
import 'package:guide_me/features/profile/presentation/widgets/settings_widgets/settings_section.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: context.isPortrait ? size.height * 0.05 : size.width * .05,
          ),

          // App bar
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.p),
            child: const SettingsAppBar(),
          ),

          const SizedBox(height: 8),

          const Expanded(child: SettingsSection()),
        ],
      ),
    );
  }
}
