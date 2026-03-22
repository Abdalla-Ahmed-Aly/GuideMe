import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/styles/app_colors.dart';

class CloseButtonwidget extends StatelessWidget {
  const CloseButtonwidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pop();
      },
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: const Color(0xffFFE5BA).withValues(alpha: .2),
          border: Border.all(color: const Color(0XFFCF872F)),
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.close,
          color: AppColors.primary,
        ),
      ),
    );
  }
}
