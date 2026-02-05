import 'package:flutter/material.dart';
import 'package:guide_me/features/profile/presentation/widgets/edit_profile_widgets/edit_profile_app_bar.dart';
import 'package:guide_me/features/profile/presentation/widgets/edit_profile_widgets/edit_profile_section.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          EditProfileAppBar(),

          Expanded(
            child: EditProfileSection(),
          ),
        ],
      ),
    );
  }
}
