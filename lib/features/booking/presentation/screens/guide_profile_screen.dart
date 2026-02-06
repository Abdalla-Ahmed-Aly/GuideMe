import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/features/booking/presentation/widgets/custom_appbar.dart';
import 'package:guide_me/features/booking/presentation/widgets/guide_profile_widgets/guide_data_section.dart';

class GuideProfileScreen extends StatelessWidget {
  const GuideProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppbar(
            text: context.l10n.guideProfile,
          ),

          const Expanded(child: GuideDataSection()),
        ],
      ),
    );
  }
}
