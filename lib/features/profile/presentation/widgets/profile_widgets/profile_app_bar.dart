import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/app_assets/app_icons.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: context.isPortrait ? size.height * 0.06 : size.width * 0.05,
        ),

        Padding(
          padding: EdgeInsets.only(left: 38.p, right: 20.p),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n.profile,
                style: AppTextStyles.poppinsBold24,
              ),

              InkWell(
                splashColor: Colors.transparent,
                onTap: () {
                  context.push(AppRoutes.settingsScreen);
                },
                child: SvgPicture.asset(
                  AppIcons.settings,
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
