import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/widgets/app_button.dart';

class PrimaryActionButton extends StatelessWidget {
  const PrimaryActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppButton(
            onPressed: () {
              context.push(AppRoutes.guideProfileScreen);
            },
            text: context.l10n.guideProfile1,
            height: 48,
          ),
        ),

        const SizedBox(width: 34),

        Expanded(
          child: AppButton(
            onPressed: () {},
            text: context.l10n.bookaTour,
            height: 48,
          ),
        ),
      ],
    );
  }
}
