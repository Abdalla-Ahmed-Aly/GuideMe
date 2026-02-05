import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class EditProfileAppBar extends StatelessWidget {
  const EditProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        SizedBox(
          height: context.isPortrait ? size.height * 0.06 : size.width * 0.05,
        ),

        // App bar
        Padding(
          padding: EdgeInsets.only(left: 38.p, right: 28.p),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Title
              Text(
                context.l10n.editProfile,
                style: AppTextStyles.poppinsBold26,
              ),

              GestureDetector(
                onTap: () {
                  context.pop();
                },
                child: const Icon(
                  Icons.logout,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 8),

        const Divider(
          color: AppColors.natural2,
          thickness: 2,
        ),
      ],
    );
  }
}
