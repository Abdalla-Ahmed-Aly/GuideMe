import 'package:flutter/material.dart';
import 'package:guide_me/features/profile/presentation/widgets/profile_widgets/profile_app_bar.dart';
import 'package:guide_me/features/profile/presentation/widgets/profile_widgets/profile_info_section.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          // App bar
          ProfileAppBar(),

          Expanded(
            child: ProfileInfoSection(),
          ),
        ],
      ),
    );
  }
}
