import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/core/widgets/app_outlined_button.dart';

class AcceptedScreenButtons extends StatelessWidget {
  const AcceptedScreenButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppButton(
          onPressed: () {
            context.pop();
          },
          text: context.l10n.viewSchedule,
          radius: 50,
          height: 48,
          backgroundColor: const Color(0xffF2930D),
        ),

        const SizedBox(height: 20),

        AppOutlinedButton(
          text: context.l10n.chatwithtoUurist,
          onPressed: () {},
        ),
      ],
    );
  }
}
