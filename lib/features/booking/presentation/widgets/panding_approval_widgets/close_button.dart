import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';

class CloseButtonwidget extends StatelessWidget {
  const CloseButtonwidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35.w,
      decoration: BoxDecoration(
        color: const Color(0xffFFE5BA).withValues(alpha: .2),
        border: Border.all(color: const Color(0XFFCF872F)),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: () {
          context.pop();
        },
        icon: Center(
          child: Icon(
            FontAwesomeIcons.xmark,
            color: AppColors.primary,
            size: 20.ic,
          ),
        ),
      ),
    );
  }
}
