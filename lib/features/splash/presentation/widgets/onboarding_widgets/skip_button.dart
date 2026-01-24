import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key, required this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        context.l10n.skip,
        style: AppTextStyles.poppinsMedium18,
      ),
    );
  }
}
