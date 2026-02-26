import 'package:flutter/material.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/features/booking/presentation/widgets/custom_appbar.dart';
import 'package:guide_me/features/booking/presentation/widgets/guide_profile_widgets/guide_data_section.dart';

class GuideProfileScreen extends StatelessWidget {
  const GuideProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: AlignmentGeometry.center,
            children: [
              CustomAppbar(
                text: context.l10n.guideProfile,
              ),
              Align(
                alignment: AlignmentGeometry.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 35, right: 19),
                  child: Image.asset(
                    AppImages.setting,
                    width: 27.w,
                  ),
                ),
              ),
            ],
          ),

          const Expanded(child: GuideDataSection()),
        ],
      ),
    );
  }
}
