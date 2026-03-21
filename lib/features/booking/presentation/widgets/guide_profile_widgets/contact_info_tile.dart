import 'package:flutter/material.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class ContactInfoTile extends StatelessWidget {
  const ContactInfoTile({
    super.key,
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: AppColors.primary2,
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Text(
            text,
            style: AppTextStyles.interRegular18.copyWith(
              color: const Color(0xffB59A64),
            ),
          ),
        ),
      ],
    );
  }
}
