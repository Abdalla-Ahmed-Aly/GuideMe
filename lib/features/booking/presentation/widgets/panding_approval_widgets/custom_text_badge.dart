import 'package:flutter/material.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class CustomTextBadge extends StatelessWidget {
  const CustomTextBadge({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xffFFE5BA).withValues(alpha: .3),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xffFFE5BA)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircleAvatar(
            radius: 6,
            backgroundColor: Color(0xFFF5C26C),
          ),
          const SizedBox(width: 13),
          Text(
            text,
            style: AppTextStyles.poppinsMedium16.copyWith(
              color: const Color(0xffF4A60E),
            ),
          ),
        ],
      ),
    );
  }
}
